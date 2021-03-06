<%@page import="java.util.HashMap"%>
<%@page import="ourhouse.common.vo.MypagePhotoVO"%>
<%@page import="ourhouse.common.vo.AtchFileVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ourhouse.common.vo.PostVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ourhouse.common.vo.MemberVO"%>
<%
	MemberVO memVO = (MemberVO)request.getAttribute("member");
	int followCnt = (Integer)request.getAttribute("following");
	int followerCnt = (Integer)request.getAttribute("follower");
	int likesCnt = (Integer)request.getAttribute("likes");
	int coupon = (Integer)request.getAttribute("coupon");
	String img = (String)request.getAttribute("img");
	int QnaReply = (Integer)request.getAttribute("QnaReplyCnt");
	
	MemberVO m = (MemberVO) session.getAttribute("session");
	
	List<PostVO> QnAList = (List<PostVO>)request.getAttribute("QnAList");
	
// 	List<AtchFileVO> atchList = (List<AtchFileVO>)request.getAttribute("atchFile");

	List<MypagePhotoVO> mpList = (List<MypagePhotoVO>)request.getAttribute("MpPostPhoto");
	
	List<AtchFileVO> QatchList = (List<AtchFileVO>)request.getAttribute("QatchFile");
	
	List<PostVO> postList = new ArrayList();
	
	postList = (List<PostVO>)request.getAttribute("PostList");
	
	String memId = memVO.getMemId();

	List<String> hashtag = new ArrayList(); 

	if(QnAList!=null){
		if(QnAList.get(0).getHouseId()!=null ||QnAList.get(0).getHouseId()!="" ){
			hashtag.add(QnAList.get(0).getHouseId());
		}
		if(QnAList.get(0).getSpaceId()!=null ||QnAList.get(0).getSpaceId()!="" ){
			hashtag.add(QnAList.get(0).getSpaceId());
		}
		if(QnAList.get(0).getRoomId()!=null ||QnAList.get(0).getRoomId()!="" ){
			hashtag.add(QnAList.get(0).getRoomId());
		}
		if(QnAList.get(0).getStyleId()!=null ||QnAList.get(0).getStyleId()!="" ){
			hashtag.add(QnAList.get(0).getStyleId());
		}
		if(QnAList.get(0).getColorId()!=null ||QnAList.get(0).getColorId()!="" ){
			hashtag.add(QnAList.get(0).getColorId());
		}
	}
	
	System.out.println(hashtag);

%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>???????????? | ??????????????? </title>

    <meta name="author" content="3team">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1, minimum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- ?????? ?????? -->
    <link rel="icon" href="../image/PNG/favicon.png">
    <link rel="apple-touch-icon" href="../image/PNG/favicon.png">
    
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/mypage.css">
    <link rel="stylesheet" href="../../css/mycoupon.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="../js/mypage.js"></script>
	<script src="../../js/member/memberCoupon.js"></script>
    <title>Document</title>
    
    <script type="text/javascript">
    $(function(){
    	loginCheck();//???????????????
    	loginTrue();//????????? ????????????
    	
    });
    function loginCheck(){
		<%if(m == null){%> //???????????? ????????? vo?????? null??????
             //?????????????????????
             alert("????????? ??? ??????????????????");
			 location.href = "<%=request.getContextPath()%>/main.do";
		<%}%>
	}
    
    function loginTrue(){
    	<%if(m == null){%> //????????? ????????? ?????????
			$("#loginTag").show();//????????????????????????
    		$("#logOutTag").hide();//????????????????????????
    		$("#signUpTag").show();//?????????????????????
    	<%}else{%>
    		$("#loginTag").hide();//??????????????? ??????
    		$("#logOutTag").show();//???????????????????????????
    		$("#signUpTag").hide();//??????????????????
    	<%}%>
    }
    </script>
</head>

<body>

<div class="body__container">

    <!-- ?????? HEADER -->
    <%-- <header class="section">
        <div class="inner clearfix">

            <div class="menu-group float--left">
                
                <div class="logo">
                    <a href="/main.do">????????????</a>
                </div>
            </div>

            <div class="sign-group float--right">

                <form id="search-form" method="GET" action="/searchTotal.do">
                    <span class="search-icon"></span>
                    <input type="text" id="search" name="search" class="input--text" placeholder="???????????? ????????????">
                    <input type="submit" value="Submit">
                </form>

                <ul class="sub-menu">
                    <li><a href="<%=request.getContextPath()%>/member/signin.do" id="loginTag">?????????</a></li>
                    <li><a href="<%=request.getContextPath()%>/member/signup.do" id="signUpTag">????????????</a></li>
                    <li><a href="/views/signin/logOut.jsp" id="logOutTag">????????????</a></li>
                </ul>

                <div class="btn-group">
                    <a href="" class="btn">?????????
                        <i style="margin-left: 10px;"class="fas fa-angle-down"></i>
                    </a>
                </div>
            </div>
        </div>
    </header> --%>
    
    <!-- ????????? ?????? ????????? ?????? -->
    <header class="section">
        <div class="inner clearfix">

            <div class="menu-group float--left">
                
                <div class="logo">
                    <a href="/main.do">????????????</a>
                </div>

            </div>

            <div class="sign-group float--right">

                <form id="search-form" method="GET" action="/searchTotal.do">
                    <span class="search-icon"></span>
                    <input type="text" id="search" name="search" class="input--text" placeholder="???????????? ????????????">
                    <input type="submit" value="Submit">
                </form>

                <ul class="sub-menu">
                    <li><a href="/member/signin.do" id="loginTag">?????????</a></li>
                    <li><a href="/views/signin/logOut.jsp" id="logOutTag">????????????</a></li>
                    <li><a href="/member/signup.do" id="signUpTag">????????????</a></li>
                </ul>

                <div class="btn-group dropdown--writelist">
                    <button type="button" class="btn btn-write">?????????
                        <i style="margin-left: 10px;"class="fas fa-angle-down"></i>
                    </button>
                    
                    <ul class="dropdown-write">
                        <li class="write-item" onclick="writePhoto()">
                            <img src="../../image/PNG/picture.png" alt=""> 

                            <a class="write-info">
                                <span class="write--title">?????? ?????????</span>
                                <span class="write--description">????????? ????????? ??????????????????.</span>
                            </a>
                        </li>
                        <li class="write-item" onclick="writeQna()">
                            <img src="../../image/PNG/question.png" alt=""> 

                            <a class="write-info">
                                 <span class="write--title">???????????? ????????????</span>
                                 <span class="write--description">???????????? ??????????????? ??????????????????.</span>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
    </header>

    <!-- ?????????, ?????? ???????????? ?????? ?????? -->
    <header class="section section-profile_nav">
        <div class="inner">
            <ul>
                <li><a href="#">?????????</a></li>
                <li><a href="/member/memberInfoUpdate.do">??????</a></li>
            </ul>
        </div>
    </header>

    <!-- ????????????, ??????, ???????????????, ????????? ???????????? ?????? ?????? -->
    <header class="section section-profile-subnav">
        <div class="inner">
            <ul>
                <li style="border-bottom:4px solid #35C5F0"><a style="color:#35C5F0" href="/member/mypage.do">????????????</a></li>
                <li><a href="#" onclick="showMemPhoto('<%=memId %>')">??????</a></li>
                <li><a href="#" onclick="showMemQnA('<%=memId %>')">???????????????</a></li>
                <li><a href="#" onclick="showMemLike('<%=memId %>')">?????????</a></li>
                <li><a href="#" onclick="addCoupon('<%=memId %>')">??? ??????</a></li>

                <!-- 
                <li><a href="#">??????????????????</a></li>
                <li><a href="#">???????????? ??????</a></li>
                 -->
            </ul>
           </div> 
    </header>

    <!-- ??????????????? -->
    <section class="section section--profile">
        <div class="inner clearfix">

            <!-- ?????? ?????? ?????? -->
            <div class="procontainer float--left">

                <div class="myprofile_procontainer">
                   <%if(img!=null) {%>
                    <img src="../image/uploads/<%=img %>" alt="">
					<%}else{ %>
                    <img src="../image/uploads/default_profile.png" alt="">
					<%} %>
                    <div class="profile-info">

                        <div class="user-name">
                            <span class="user-Nickname"><%=memVO.getMemNickname() %></span><br>
                            <span class="user-introduce"><%=(memVO.getMemIntro()!=null)?memVO.getMemIntro():"" %></span>
                        </div>

                        <div class="user-follow-state">
                            <div class="follow-state-info">
                                <a href="/mypage/followerList.do">
                                    <span>?????????</span>
                                    <span class="state__follow"><%=followerCnt %></span>
                                </a>
                            </div>

                            <div class="vertical-bar"></div>

                            <div class="follower-state-info">
                                <a href="/mypage/followingList.do">
                                    <span>?????????</span>
                                    <span class="state__follower"><%=followCnt %></span>
                                </a>
                            </div>
                        </div>
                        
                        <div class="user-info__btn">
                            <a href="<%=request.getContextPath() %>/member/memberInfoUpdate.do" class="profile_btn">
                                ??????
                            </a>
                        </div>

                        <div class="user-profile_links">
                            <ul class="links">

                                <li>
                                    <i class="far fa-heart"></i>
                                    <span class="links-title"><a href="#" onclick="showMemLike('<%=memId %>')">?????????</a></span>
                                    <span class="links-state"><%=likesCnt %></span>
                                </li>

                                <li>
                                    <i class="far fa-credit-card"></i>
                                    <span class="links-title"><a href="#" onclick="addCoupon('<%=memId %>')">??? ??????</a></span>
                                    <span class="links-state"><%=coupon %></span>
                                </li>
                            </ul>

                        </div>

                    </div>
                </div>
            </div>

            <!--  -->

            <div class="contents-container float--right">

                <div class="picturecontainer">

                    <div class="picturetitle">
                        
                        <div class="title">
                            ??????
                            <span class="pictures_sum">
                            <% if(postList!=null) {%>
                            <%=postList.size() %>
                            <% } %>
                            </span>
                        </div>

                        <div class="allView" id="memPhoto">
                           <a href="#"  onclick="showMemPhoto('<%=memId %>')">????????????</a> 
                           <input type="hidden" name="memId" value="<%=memVO.getMemId()%>">
                        </div>

                    </div>

                    <div class="pictures-container">

                        <div class="box-container">
                            <div class="picture-box">
                            <%if(mpList!=null){ %>
                            	<a href="/photo/detail.do?postNo=<%=mpList.get(0).getPostNo() %>">
                                	<img src="../image/uploads/<%=mpList.get(0).getFileFileNm() %>" alt="">
                            	</a>
                            <% } %>
                            </div>
                            
                            <div class="picture-title">
                            	<%if(postList!=null && postList.size()>0&&mpList.get(0).getHashtag()!=null){ %>
                               <%=mpList.get(0).getHashtag() %>
                                <% }else { %>
                                
                                <%} %>
                            </div>
                        </div>

                        <div class="box-container">
	                        <div class="picture-box">
	                        <%if(mpList!=null && mpList.size() >2){ %>
	                        	<a href="/photo/detail.do?postNo=<%=mpList.get(1).getPostNo() %>">
									<img alt="" src="../image/uploads/<%=mpList.get(1).getFileFileNm() %>">
								</a>
	                        <% } %>
	                        </div>
                            
                            <div class="picture-title">
                            	<%if(postList!=null && postList.size()>2 &&mpList.get(1).getHashtag()!=null&& mpList.size() >2){ %>
                               <%=mpList.get(1).getHashtag() %>
                                <% }else { %>
                                
                                <%} %>
                            </div>
	                        
                        </div>

                        <div class="box-container">
	                        <div class="picture-box">
	                        <%if(mpList!=null && mpList.size() >3){ %>
	                        	<a href="/photo/detail.do?postNo=<%=mpList.get(2).getPostNo() %>">
									<img alt="" src="../image/uploads/<%=mpList.get(2).getFileFileNm() %>">
	                        	</a>
	                        <% } %>
	                        </div>
                            
                            <div class="picture-title">
                            	<%if(postList!=null && postList.size()>3&&mpList.get(2).getHashtag()!=null&& mpList.size() >3){ %>
                              	 <%=mpList.get(2).getHashtag() %>
                                 <% }else { %>
                                
                                <%} %>
                            </div>
                        </div>

                        <div class="box-container">
	                        <div class="picture-box">
	                        <%if(mpList!=null&& postList.size()>4 && mpList.size() >4){ %>
	                        	<a href="/photo/detail.do?postNo=<%=mpList.get(3).getPostNo() %>">
									<img alt="" src="../image/uploads/<%=mpList.get(3).getFileFileNm() %>">
	                      		</a>
	                        <% } %>
	                        </div>
                            
                            <div class="picture-title">
                            	<%if(postList!=null && postList.size()>4 &&mpList.get(3).getHashtag()!=null&& mpList.size() >4){ %>
                               <%=mpList.get(3).getHashtag() %>
                                 <% }else { %>
                                
                                <%} %>
                            </div>
                        </div>

                    </div>

                </div>
			<!--    ????????? ?????? -->
                <div class="QnAcontainer" >

                      <%if(QnAList!=null){ %>  
                    <div class="QnAtitle">
                        <div class="title">
                            ????????? ??????
                            <span class="QnA_sum">
                            <% if(QnAList!=null){ %>
                            <%=QnAList.size() %>
                            <% } %>
                            </span>
                        </div>

                        <div class="allView">
                            ????????????
                        </div>

                    </div>

                    <div class="QnA-container">
						   <% if(QnAList!=null){ %>
                        <div class="writecontainer" onclick="location.href='/qna/detail.do?postNo=<%=QnAList.get(0).getPostNo()%>'">

                            <div class="write-box">

                                <div class="write-content">
                                    <div class="write_title">
                                    <% if(QnAList!=null){ %>
                                        <%=QnAList.get(0).getPostTitle() %>
                                       <% } %> 
                                    </div>

                                    <div class="write_comment">
                                    <% if(QnAList!=null){ %>
                                       <%=QnAList.get(0).getPostContent() %>
                                       <% } %>
                                    </div>
                                </div>

                                <div class="write_info">
                                    <div class="writer">
                                        <span>by</span>

                                        <!-- ???????????? ??????????????? -->
                                        <span>
                                       <% if(QnAList!=null){ %>
                                          <%=memVO.getMemNickname() %>
                                          <% } %>
                                        </span>
                                    </div>

                                    <!-- ???????????? -->
                                    <div class="write_date">
                                    	 <% if(QnAList!=null){ %>
                                       <%=QnAList.get(0).getPostDate() %>
                                       <% } %>
                                    </div>

                                    <div class="dashed_vertical"></div>

                                    <div class="write_comment">
                                        <span>??????</span>
                                        
                                        <!-- ?????? ??? -->
                                        <span>
                                            <%=QnaReply %>
                                        </span>
                                    </div>

                                    <div class="dashed_vertical"></div>

                                    <div class="write_lookup">
                                        <span>??????</span>

                                        <!-- ????????? -->
                                        <span>
                                       <% if(QnAList!=null){ %>
                                          <%=QnAList.get(0).getPostView() %>
                                          <% } %>
                                        </span>
                                    </div>

                                    <div class="write_keyword-box">
                                    <%if(hashtag!=null){ %>
                            	<%for(int i = 0 ; i < hashtag.size() ; i++){ %>
	                            	<%if(!(hashtag.get(i).equals(" "))){ %>
	                            	<a class="write_keyword" onclick="searchTag('<%=hashtag.get(i) %>')" >
		                                <span>#</span>
<%-- 		                                <span><%=hashtag %></span> --%>
		                                <span onclick="location='/search.do?hashtag=<%=hashtag.get(i) %>'"><%=hashtag.get(i) %></span>
	                            	</a>
	                                <%} %>
                                <%} %>
                                	<%} %>
                                    </div>

                                </div>
                            </div>

                            <!-- ?????? ????????? .nonactive ????????? ?????? -->
                            <% if(QatchList!=null){ %>
                            <div class="writeImg-box">
                                <img src="../image/uploads/<%=QatchList.get(0).getStreFileNm() %>" alt="">
                            </div>
								<%} %>                            

                        </div>
							<%} %>
                    </div>
					<%} %>
                </div>

            </div>

        </div>
    </section>
</div>
    <!-- FOOTER -->
    <footer class="section">
            <div class="inner clearfix">

                <ul class="site-links float--right">
                    <li>@Copyright ?? 2020 ~ 2020 by Daedockplace, Inc All rights reserved</li>
                </ul>

                <ul class="site-links float--left">
                    <li><a href="#">????????? ?????????</a></li>
                    <li><a href="#">????????????</a></li>
                    <li><a href="#">????????????????????????</a></li>
                    <li><a href="#">????????????</a></li>
                    <li><a href="#">????????????</a></li>
                </ul>
            </div>
    </footer>


<!--     <script src="../js/mypage.js"></script> -->
    <script src="../js/writebtn.js"></script>
</body>
</html>