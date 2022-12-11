<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function checkMenu() {
		if(${sessionId == null}) {
			alert("로그인이 필요한 서비스입니다.");
			return false;
		}
		location.href = "./add-bakery.jsp";
	}
</script>
<header>
    <div class="px-3 py-2" style="background-color: #D9D5A3">
      <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
          <a href='<c:url value="/welcome.jsp"/>' class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
            <img src='<c:url value="/resources/images/logo.png"/>' alt="logo image"/>
          </a>

          <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
            <li>
              <a href='<c:url value="/welcome.jsp"/>' class="nav-link text-secondary">
                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#home"/></svg>
                Home
              </a>
            </li>
            <li>
              <a href='<c:url value="/bakerys.jsp"/>' class="nav-link text-white">
                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#speedometer2"/></svg>
                가게 목록
              </a>
            </li>
            <li>
              <a href='<c:url value="/add-bakery.jsp"/>' onclick="checkMenu(); return false;" class="nav-link text-white">
                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#table"/></svg>
                가게 등록
              </a>
            </li>
            <li>
              <a href='<c:url value="/edit-bakery.jsp"/>' class="nav-link text-white">
                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#grid"/></svg>
                가게 편집
              </a>
            </li>
            <li>
              <a href='<c:url value="/ReviewListAction.do?pageNum=1"/>' class="nav-link text-white">
                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#people-circle"/></svg>
                방문 후기
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
 </header>