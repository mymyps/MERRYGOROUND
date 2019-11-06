package com.kh.spring.common.encrypt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import org.springframework.stereotype.Component;

@Component
public class AEScrypto implements MyEncrypt{
	//자바는 기본적으로 암호화객체를 API로 제공하고 있음
	//javax.crypto패키지에서 암호화관련 내용을 제공
	//암호화 알고리즘은 java.security패키지에서 제공
	//대칭암호화를 위한 대칭키가 필요함
	private SecretKey key;//암화키
	
	public AEScrypto() throws NoSuchAlgorithmException {
		//key생성파일이 있는지 확인하고 있으면 파일에 저장된 key값을 가져오고
		//없으면 getkey통해서 key파일을 생성
		String path=this.getClass().getResource("/").getPath();
		path=path.substring(0,path.lastIndexOf("/classes"));
		File f=new File(path+"/mykey.key");
		if(f.exists()) {
			try(ObjectInputStream ois=new ObjectInputStream(new FileInputStream(f))){
				key=(SecretKey)ois.readObject();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			if(key==null) {
				getKey();
			}
		}
		
	}
	
	private void getKey() throws NoSuchAlgorithmException{
		SecureRandom sRandom=new SecureRandom();//키값생성을 위한 sort값
		//Math.random() 랜덤값을 만들었는데.. 이 SecureRandom객체는
		//Math.random의 랜덤값보다 더 정교한방식을 만들어낸 랜덤값.
		KeyGenerator keygen;//key를 생성하는 객체
		//key생성에 필요한 알고리즘을 적용해 키 생성객체를 세팅
		keygen=KeyGenerator.getInstance("AES");
		//객체에 선언된 알고리즘을 초기화
		keygen.init(128,sRandom);//256비트이용, sort는 랜덤으로 적용
		key=keygen.generateKey();//키를 생성
		//한번 암호한 key는 계속 그key로만 복호화 암호화를 해야하기때문에
		//동일한 값으로 보관되어야 함.
		//만든키는 파일로 보관을 진행~
		//만든 암호화키는 저장장소를 WEB-INF폴더에 저장
		String path=this.getClass().getResource("/").getPath();//클래스의 위치
		//c://01_hellspring/src/WEB-INF/classes/com/
		path=path.substring(0,path.lastIndexOf("/classes"));
		File f=new File(path+"/mykey.key");
		try(ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(f))){
			oos.writeObject(key);
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}

	@Override
	public String encrypt(String msg) throws Exception {
		//생성한 key를 이용하여 암호화를 진행하면됨.
		// Cipher객체를 통해서 암호화 및 복호화를 할 수 있음.
		Cipher cipher=Cipher.getInstance("AES");//암호화할 알고리즘으로 생성
		cipher.init(Cipher.ENCRYPT_MODE,key);
		byte[] encryptResult=cipher.doFinal(msg.getBytes());
		return Base64.getEncoder().encodeToString(encryptResult);
	}

	@Override
	public String decrypt(String msg) throws Exception {
		Cipher cipher=Cipher.getInstance("AES");//암호화할 알고리즘으로 생성
		cipher.init(Cipher.DECRYPT_MODE,key);
		byte[] encryptResult=cipher.doFinal(msg.getBytes());
		return Base64.getEncoder().encodeToString(encryptResult);
	}
	
}








