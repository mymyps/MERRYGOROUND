package com.mgr.merry.common;

public class PageBarFactory {

   public static String getPageBar(int totalCount, int cPage, int numPerpage, String url) {

      String pageBar = "";
      int pageBarSize = 5;

      int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
      int pageEnd = pageNo + pageBarSize - 1;

      int totalPage = (int) Math.ceil((double) totalCount / numPerpage);

      pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

      if (pageNo == 1) {
         pageBar += "<li class='page-item disabled'>";
         pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
         pageBar += "</li>";

      } else {
         pageBar += "<li class='page-item'>";
         pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>";
         pageBar += "</li>";
      }

      while (!(pageNo > pageEnd || pageNo > totalPage)) {
         if (cPage == pageNo) {
            pageBar += "<li class='page-item active'>";
            pageBar += "<a class='page-link'>" + pageNo + "</a>";
            pageBar += "</li>";
         } else {
            pageBar += "<li class='page-item'>";
            pageBar += "<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>" + pageNo + "</a>";
            pageBar += "</li>";
         }
         pageNo++;
      }

      if (pageNo > totalPage) {
         pageBar += "<li class='page-item disabled'>";
         pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
         pageBar += "</li>";
      } else {
         pageBar += "<li class='page-item'>";
         pageBar += "<a class='page-link' " + "href='javascript:fn_paging(" + pageNo + ")'>다음</a>";
         pageBar += "</li>";
      }
      pageBar += "</ul>";

      pageBar += "<script>";
      pageBar += "function fn_paging(cPage){";

		if (url.split("\\?")[0].equals("/19AM_MERRYGOROUND_final/sign/mypage.do")) {
			pageBar += "location.href='" + url + "&cPage='+cPage";
		}else if(url.split("\\?")[0].equals("/19AM_MERRYGOROUND_final/search/subThemaList")){
			pageBar += "location.href='" + url + "&themaNum=" + "themaNum" + "?themaNumRef=" + "themaNumRef"+ "?cPage='+cPage";
		}else{
			pageBar += "location.href='" + url + "&cPage='+cPage";
		}
		pageBar += "}";
		pageBar += "</script>";
		return pageBar;
	}

}