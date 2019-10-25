package com.mgr.merry.sign.model.service;

import java.util.List;

import com.mgr.merry.sign.model.vo.Members;

public interface SignService {
	int insertMember(Members m);
	Members selectMemberOne(Members m);
	Members selectMember(Members m,int memNo);
	int updateMember(Members m);
}
