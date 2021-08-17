<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:useBean id="now" class="java.util.Date" />
<style>
.search-label {
	display: inline-block;
	font-size: 14px;
	padding: 6px 15px 10px 15px;
	border-radius: 2rem;
	cursor: pointer;
	position: relative;
	overflow: hidden;
	transition: all 0.2s;
	-moz-user-select: none;
	-webkit-user-select: none;
	background-color: #6ba4e9;
	color: white;
	margin-left: 10px;
	margin-bottom: 15px;
}
.is-comment .media-content { line-height: 1.6; }

.card.is-post .comments-wrap .comments-body .is-comment .media-content a, .shop-wrapper .cart-container .cart-content .cart-summary .is-post.summary-card .comments-wrap .comments-body .is-comment .media-content a { display: inline; font-weight: 600 !important; font-size: 0.9rem;}

.is-comment > .media-content > .time {
	display: inline !important;
	font-size: .8rem !important;
    color: #888da8;
    margin-bottom: 10px;
    margin-left: 0.5rem;
}

.media-content > div > pre {
    background-color: transparent !important;
    color: unset;
    font-size: .875em;
    overflow-x: auto;
    padding: 0 !important;
    white-space: pre-wrap;
    word-wrap: normal;
    font-family:ONE-Mobile-Regular;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/assets/js/global.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/assets/js/webcam.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/assets/js/compose.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/assets/js/autocompletes.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/assets/js/tour.js"></script>

<script src="${pageContext.request.contextPath}/resources/template/assets/css/app.css"></script>
<script src="${pageContext.request.contextPath}/resources/template/assets/css/core.css"></script>
<div class="feedContents">
	<c:forEach items="${feedList }" var="vo" varStatus="status">
		<div id="feed-post-1" class="card is-post">
			<!-- Main wrap -->
			<div class="content-wrap" data-crap="${status.index }">
				<!-- Post header -->
				<div class="card-heading">
					<!-- User meta -->
					<div class="user-block">
						<div class="image">
							<img src="https://via.placeholder.com/300x300"
								data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1"
								alt="">
						</div>
						<div class="user-info" id="${vo.feed_id }">
							<a href="#">${vo.name }
							<svg viewBox="0 0 24 24" width="21" height="15" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M12 19l7-7 3 3-7 7-3-3z"></path><path d="M18 13l-1.5-7.5L2 2l3.5 14.5L13 18l5-5z"></path><path d="M2 2l7.586 7.586"></path><circle cx="11" cy="11" r="2"></circle></svg>
							  ${vo.write_lan } </a> <span class="time postTime"><fmt:formatDate
									value="${vo.reg_date }" pattern="yyyy-MM-dd HH:mm:ss" /></span>

						</div>
					</div>
					<!-- Right side dropdown -->
					<!-- /partials/pages/feed/dropdowns/feed-post-dropdown.html -->
					<div
						class="dropdown is-spaced is-right is-neutral dropdown-trigger"
						onclick="initDropdowns()">
						<div>
							<div class="button">
								<svg viewBox="0 0 24 24" width="24" height="24"
									stroke="currentColor" stroke-width="2" fill="none"
									stroke-linecap="round" stroke-linejoin="round"
									class="css-i6dzq1">
									<line x1="8" y1="6" x2="21" y2="6"></line>
									<line x1="8" y1="12" x2="21" y2="12"></line>
									<line x1="8" y1="18" x2="21" y2="18"></line>
									<line x1="3" y1="6" x2="3.01" y2="6"></line>
									<line x1="3" y1="12" x2="3.01" y2="12"></line>
									<line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
							</div>
						</div>
						<div class="dropdown-menu" role="menu">
							<div class="dropdown-content">
								<a href="#" class="dropdown-item">
									<div class="media">
										<i data-feather="bookmark"></i>
										<div class="media-content" id="${vo.content }"
											onclick="trans('${vo.feed_id }','${vo.content }'); return false;">
											<h3>번역</h3>
										</div>
									</div>
								</a>
								<c:if test="${vo.user_id ne user.user_id}">
								<a class="dropdown-item">
									<div class="media">
										<div class="media-content" id="feedcor" data-fid="${vo.feed_id }"
										data-fidx="${status.index }">
											<h3>교정</h3>
										</div>
									</div>
								</a>
									<hr class="dropdown-divider">
									<a class="dropdown-item">
										<div class="media">
											<div class="media-content" id="frbtn"
												data-repo2="${vo.feed_id }" data-report2="${vo.user_id }">
												<h3>신고</h3>
											</div>
										<div class="dropdown-menu">
											<div class="dropdown-content reportMenu">
												<div class="media freport" style="border: 0px;">
													<table id="report-table">
														<tr>
															<td><input type="radio" id="fmsg"
																name="${vo.feed_id }" value="스팸 게시물">스팸 게시물</td>
														</tr>
														<tr>
															<td><input type="radio" id="fmsg"
																name="${vo.feed_id }" value="가짜정보 제공">가짜정보 제공</td>
														</tr>
														<tr>
															<td><input type="radio" id="fmsg"
																name="${vo.feed_id }" value="성적인 내용">성적인 내용</td>
														</tr>
														<tr>
															<td><input type="radio" id="fmsg"
																name="${vo.feed_id }" value="데이트가 목적인 내용">데이트가
																목적인 내용</td>
														</tr>
														<tr>
															<td><input type="radio" id="fmsg"
																name="${vo.feed_id }" value="욕설/비방">욕설/비방</td>
														</tr>
														<tr>
															<td><input type="radio" id="fmsg"
																name="${vo.feed_id }" value="기타">기타</td>
														</tr>
														<tr>
															<td><input placeholder="신고이유" hidden="true"
																data-rftxt="${vo.feed_id }" maxlength="30"></input></td>
														</tr>
													</table>
												</div>
												<div class="dropdown-divider"></div>
                                                 <div class="reported-div">
					                       		 <input type="checkbox" id="feed-blocked" data-rfchk="${vo.feed_id  }" value="${vo.user_id }">${vo.name } 차단
												 <button id="report-btn"  data-repo2="${vo.feed_id  }" data-report2="${vo.user_id }">신고</button>
                                                 </div>
											</div>
										</div>
									</div>
									</a>
								</c:if>
								<c:if test="${vo.user_id eq user.user_id}">
									<hr class="dropdown-divider">
									<a class="dropdown-item">
										<div class="media feedUpdate" id="update${vo.feed_id }"
											onclick="feedUpdate('${vo.feed_id }')">
											<i data-feather="bell"></i>
											<div class="media-content">
												<input type="hidden" id="update-tag" name="update-tag"
													value="${vo.tags }"> <input type="hidden"
													id="update-content" name="update-content"
													value="${vo.content }"> <input type="hidden"
													id="update-photo" name="update-photo" value="${vo.uuid }">
												<input type="hidden" id="update-fphoto" name="update-fphoto"
													value="${vo.fphoto }">
												<h3>수정</h3>
											</div>
										</div> <a href="#" class="dropdown-item">
											<div class="media">
												<i data-feather="flag"></i>
												<div class="media-content delFeed" id="${vo.feed_id }">
													<h3>삭제</h3>
												</div>
											</div>
									</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<!-- /Post header -->
				<!-- Post body -->
				<div class="card-body">
					<!-- Post body text -->
					<div class="post-text">
						<p style="font-size: 1rem; color: #5f5f5f; line-height: 1.5;
						word-wrap:break-word; white-space: pre-line;">${vo.content }</p>
						<div class="tdiv" id="tdiv${vo.feed_id }"></div>
						<div class="twdiv" id="${vo.write_lan }"></div>
					</div>
					<!-- Featured image -->
					<c:if test="${empty vo.fphoto}">
						<div class="post-image"
							style="margin-bottom: 50px; margin-top: 30px">
							<!-- Action buttons -->
							<!-- /partials/pages/feed/buttons/feed-post-actions.html -->
							<div class="like-wrapper">
								<a class="like-button"
									onclick="likeIt('${vo.feed_id}'); return false;"> <i
									class="mdi mdi-heart not-liked bouncy"></i> <i
									class="mdi mdi-heart is-liked bouncy"></i> <span
									class="like-overlay"></span>
								</a>
							</div>
							<div class="fab-wrapper is-comment">
								<a id="fab" class="small-fab"> <svg
										viewBox="0 0 24 24" width="24" height="24"
										stroke="currentColor" stroke-width="2" fill="none"
										stroke-linecap="round" stroke-linejoin="round"
										class="css-i6dzq1">
										<path
											d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
								</a>
							</div>
						</div>
					</c:if>
					<c:if test="${not empty vo.fphoto}">
						<div class="post-image">
							<img
								src='${pageContext.request.contextPath}/resources/upload/${vo.uuid}'
								alt="" />
							<!-- Action buttons -->
							<!-- /partials/pages/feed/buttons/feed-post-actions.html -->
							<div class="like-wrapper">
								<a class="like-button"
									onclick="likeIt('${vo.feed_id}'); return false;"> <i
									class="mdi mdi-heart not-liked bouncy"></i> <i
									class="mdi mdi-heart is-liked bouncy"></i> <span
									class="like-overlay"></span>
								</a>
							</div>
							<div class="fab-wrapper is-comment">
								<a id="fab" class="small-fab"> <svg
										viewBox="0 0 24 24" width="24" height="24"
										stroke="currentColor" stroke-width="2" fill="none"
										stroke-linecap="round" stroke-linejoin="round"
										class="css-i6dzq1">
										<path
											d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
								</a>
							</div>
						</div>
					</c:if>
					<div>
						<p>
							<c:if test="${not empty vo.tags }">
								<a>#${fn:replace(vo.tags,',','#')}</a>
							</c:if>
						</p>
					</div>
				</div>
				<!-- /Post body -->

				<!-- Post footer -->
				<div class="card-footer">
					<!-- Post statistics -->
					<div class="social-count">
						<div class="comments-count">
							<svg viewBox="0 0 24 24" width="24" height="24"
								stroke="currentColor" stroke-width="2" fill="none"
								stroke-linecap="round" stroke-linejoin="round"
								class="css-i6dzq1">
								<path
									d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
							<span id="minicmt" data-minicmt="${status.index }">
							<c:if test="${vo.cmt eq 0 }">0</c:if>
							<c:if test="${vo.cmt gt 0 }">${vo.cmt }</c:if>
							</span>
						</div>
						<div class="likes-count">
							<svg viewBox="0 0 24 24" width="24" height="24"
								stroke="currentColor" stroke-width="2" fill="none"
								stroke-linecap="round" stroke-linejoin="round"
								class="css-i6dzq1">
								<path
									d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
							<span id="recCnt${vo.feed_id }" >
							 ${vo.like_cnt }
							</span>
						</div>
					</div>
				</div>
				<div data-table="${status.index }"></div>
				<!-- /Post footer -->
			</div>
			<!-- /Main wrap -->				
		<!-- Post #1 Comments -->
		<div class="comments-wrap is-hidden">
			<!-- Header -->
			<div class="comments-heading" data-card="${status.index }">
				<h4>
					<spring:message code="comment.h4.title"/>
					<small>
					<c:if test="${!empty vo.cmt and vo.cmt eq 0 }">(0)</c:if>
					<c:if test="${!empty vo.cmt and vo.cmt gt 0 }">(${vo.cmt})</c:if>
					</small>
				</h4>
				<div class="close-comments">
					<svg viewBox="0 0 24 24" width="24" height="24"
						stroke="currentColor" stroke-width="2" fill="none"
						stroke-linecap="round" stroke-linejoin="round"
						class="css-i6dzq1">
						<line x1="18" y1="6" x2="6" y2="18"></line>
						<line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</div>
			</div>
			<!-- /Header -->

			<!-- Comments body -->
			<div class="comments-body has-slimscroll" data-scroll="${status.index }">

			<!-- Comment -->
			<c:if test="${!empty vo.cmt and vo.cmt gt 0 }">
				<c:forEach items="${commentList }" var="cmt">
				<!-- 피드번호가 같으면 -->
				<c:if test="${vo.feed_id eq cmt.feed_id }">
				<c:choose>
				<c:when test="${cmt.content ne '-'}">
				<!-- 일반댓글이면 -->
				<div class="media is-comment">
					<!-- User image -->
					<div class="media-left">
						<div class="image">
							<img src="https://via.placeholder.com/300x300"
								data-demo-src="assets/img/avatars/dan.jpg"
								data-user-popover="1" alt="">
						</div>
					</div>
					<!-- Content -->
					<div class="media-content">
						<a href="${pageContext.request.contextPath}/profile.do?user_id=${cmt.user_id }">${cmt.name }</a>
						<span class="time">
						<span id="cmt${cmt.comment_id }">
						<fmt:formatDate value="${cmt.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</span>
						<!-- Actions -->
						<c:if test="${cmt.user_id eq user.user_id }">
						<div class="controls" style="display: inline-block">
							<div class="edit">
								<a id="del" data-delcmt="${cmt.comment_id }" data-delcmtfeed="${cmt.feed_id }"
								data-idx="${status.index }">
								<svg
									viewBox="0 0 24 24" width="15" height="15"
									stroke="currentColor" stroke-width="2"
									fill="none" stroke-linecap="round"
									stroke-linejoin="round" class="css-i6dzq1">
									<line x1="18" y1="6" x2="6" y2="18"></line>
									<line x1="6" y1="6" x2="18" y2="18"></line></svg>
								</a>
							</div>
						</div>
						</c:if>
						</span>
						<p style="color: #525252; word-wrap:break-word; white-space: pre-line;">${cmt.content } </p>
					</div>
					<c:if test="${user.user_id ne cmt.user_id and cmt.user_id ne 'admin'}">
					<!-- Right side dropdown -->
					<div class="media-right">
						<div
							class="dropdown is-spaced is-right is-neutral dropdown-trigger">
							<div>
								<div class="button">
									<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                    <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                                    <line x1="12" y1="9" x2="12" y2="13"></line>
                                    <line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
								</div>
							</div>
							<div class="dropdown-menu" role="menu">
                            <div class="dropdown-content">
                                <div class="media">
                                <table>
	                        	<tr>
	                        		<td>
	                        			<label><input type="radio" id="msg" name="${cmt.comment_id }" value="스팸 게시물"><spring:message code="comment.report.content"/></label>
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td>
										<label><input type="radio" id="msg" name="${cmt.comment_id }" value="가짜정보 제공"><spring:message code="comment.report.lie"/></label>
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td>
										<label><input type="radio" id="msg" name="${cmt.comment_id }" value="성적인 내용"><spring:message code="comment.report.sexual"/></label>
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td>
										<label><input type="radio" id="msg" name="${cmt.comment_id }" value="데이트가 목적인 내용"><spring:message code="letter.report.date"/></label>
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td>
										<label><input type="radio" id="msg" name="${cmt.comment_id }" value="욕설/비방"><spring:message code="letter.report.word"/></label>
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td>
										<label><input type="radio" id="msg" name="${cmt.comment_id }" value="기타"><spring:message code="letter.report.etc"/></label>
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td>
									<spring:message code="comment.report.input.placeholder" var="cmt_placeholder" />								
									<input data-rtxt="${cmt.comment_id }" placeholder="${cmt_placeholder }" hidden="true"
			                        	   maxlength="30"></input>
	                        		</td>
	                        	</tr>
	                        	</table>
                                </div>
                                <div class="dropdown-divider"></div>
		                        <input type="checkbox" id="blocked" data-rchk="${cmt.comment_id  }" value="${cmt.user_id }">${cmt.name } <spring:message code="comment.report.block"/>
								<button id="fr-btn" data-repo="${cmt.comment_id  }" data-report="${cmt.user_id }">
								<spring:message code="comment.report.btn"/>
								</button>
                              </div>
                          </div>
						</div>
					</div>
					<!-- /Right side dropdown -->
					</c:if>
					</div>
					<!-- /일반댓글이면 -->
				</c:when>
				<c:otherwise>
				<!-- 교정댓글이면 -->
				<div class="media is-comment">
					<!-- User image -->
					<div class="media-left">
						<div class="image">
							<img src="https://via.placeholder.com/300x300"
								data-demo-src="assets/img/avatars/dan.jpg"
								data-user-popover="1" alt="">
						</div>
					</div>
					<!-- Content -->
					<div class="media-content">
						<a href="${pageContext.request.contextPath}/profile.do?user_id=${cmt.user_id }">${cmt.name }</a>
						<span class="time">
						<span id="cmt${cmt.comment_id }">
						<fmt:formatDate value="${cmt.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</span>
						<!-- Actions -->
						<c:if test="${cmt.user_id eq user.user_id }">
						<div class="controls" style="display: inline-block">
							<div class="edit">
								<a id="cdel" data-delcmt="${cmt.comment_id }" data-delcmtfeed="${cmt.feed_id }"
								data-idx="${status.index }">
								<svg viewBox="0 0 24 24" width="15" height="15" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
								</a>
							</div>
						</div>
						</c:if>
						</span>
						<!-- 교정댓글이면, line을 반복 -->
						<c:forEach items="${cdList }" var="cd" varStatus="stat">
							<c:if test="${cmt.comment_id eq cd.cc_id }">
							<div id="load_${cd.cc_id }${cd.line}" data-cid="${cd.cc_id }${cd.line}"
							data-cdc="${cd.content }"
							data-cdo="${cd.origin }">${cd.content }</div>
							</c:if>
						</c:forEach>
					</div>
					<c:if test="${user.user_id ne cmt.user_id}">
					<!-- Right side dropdown -->
					<div class="media-right">
						<div
							class="dropdown is-spaced is-right is-neutral dropdown-trigger">
							<div>
								<div class="button">
									<svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                    <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                                    <line x1="12" y1="9" x2="12" y2="13"></line>
                                    <line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
								</div>
							</div>
							<div class="dropdown-menu" role="menu">
                            <div class="dropdown-content">
                                <div class="media">
                                <table>
		                        	<tr>
		                       		<td>
		                       		<label><input type="radio" id="msg" name="${cmt.comment_id }" value="스팸 게시물"><spring:message code="comment.report.content"/></label>
		                       		</td>
		                        	</tr>
		                        	<tr>
		                       		<td>
									<label><input type="radio" id="msg" name="${cmt.comment_id }" value="가짜정보 제공"><spring:message code="comment.report.lie"/></label>
		                       		</td>
		                        	</tr>
		                        	<tr>
		                       		<td>
									<label><input type="radio" id="msg" name="${cmt.comment_id }" value="성적인 내용"><spring:message code="comment.report.sexual"/></label>
		                       		</td>
		                        	</tr>
		                        	<tr>
		                       		<td>
									<label><input type="radio" id="msg" name="${cmt.comment_id }" value="데이트가 목적인 내용"><spring:message code="letter.report.date"/></label>
		                       		</td>
		                        	</tr>
		                        	<tr>
		                       		<td>
									<label><input type="radio" id="msg" name="${cmt.comment_id }" value="욕설/비방"><spring:message code="letter.report.word"/></label>
		                       		</td>
		                        	</tr>
		                        	<tr>
		                       		<td>
									<label><input type="radio" id="msg" name="${cmt.comment_id }" value="기타"><spring:message code="letter.report.etc"/></label>
		                       		</td>
		                        	</tr>
		                        	<tr>
		                       		<td>
									<spring:message code="comment.report.input.placeholder" var="cmt_placeholder" />	
									<input data-rtxt="${cmt.comment_id }" placeholder="${cmt_placeholder}" hidden="true"
			                        	   maxlength="30"></input>
		                       		</td>
		                        	</tr>
		                        	</table>
                                </div>
                                <div class="dropdown-divider"></div>
		                        <input type="checkbox" id="blocked" data-rchk="${cmt.comment_id  }" value="${cmt.user_id }">${cmt.name } <spring:message code="comment.report.block"/>
								<button id="fr-btn" data-repo="${cmt.comment_id  }" data-report="${cmt.user_id }">
								<spring:message code="comment.report.block"/>
								</button>
                                </div>
                            </div>
						</div>
					</div>
					<!-- /Right side dropdown -->
					</c:if>
					</div>
				<!-- /교정댓글이면 -->
				</c:otherwise>
				</c:choose>
					</c:if>
					<!-- /피드번호가 같으면 -->
					</c:forEach>
				</c:if>
				<!-- /Comment -->
				
			</div>
			<!-- /Comments body -->

			<!-- Comments footer -->
			<div class="card-footer">
				<div class="media post-comment has-emojis">
					<!-- Comment Textarea -->
					<div class="media-content">
						<div class="field">
							<p class="control">
								<spring:message code="comment.textarea.placeholder" var="cmt_text_placeholder" />
								<textarea data-content="${vo.feed_id }" class="textarea comment-textarea" rows="5"
									placeholder="${cmt_text_placeholder }"></textarea>
							</p>
						</div>
						<!-- Additional actions -->
						<div class="actions">
							<div class="image is-32x32">
								<img class="is-rounded"
									src="https://via.placeholder.com/300x300"
									data-demo-src="assets/img/avatars/jenna.png"
									data-user-popover="0" alt="">
							</div>
							<div class="toolbar">
								<a class="button is-solid primary-button raised" id="post" data-feedid="${vo.feed_id }" data-feeduser="${vo.user_id }" data-scr="${status.index }">
								<spring:message code="comment.btn.send"/>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Comments footer -->
		</div>
		<!-- /Post #1 Comments -->
		</div>
	</c:forEach>
	<!------------------------ 포스트 끝 ------------------------->
	<div class=" load-more-wrap narrow-top has-text-centered"  id="buttonToogle">
		<a href="javascript:;" class="load-more-button">Load More</a>
	</div>
</div>
<script type="text/javascript">
	function datePosdst() {
		$('.postTime').each(function(i, el) {
			var dete = $(this).text();
			$(this).text(timeForToday(dete));
		});
	}
	datePosdst();
	
	function dateCmt() {
		$('span[id^="cmt"]').each(function(i, el) {
			var date = $(this).text();
			$(this).text(timeForToday(date));
		});
	}
	dateCmt();
	
	// 문자열 비교; diffButty.js; String
	function test_diff(cid,dif,ori) {
		var original = ori;
		var revised = dif;
		var output = $('<pre>');
		var html = diffButty(original, revised);
		output.html(html);
		var div = $('div[data-cid="'+cid+'"]');
		div.html(output);
	} 

	$(function() {
		$("div[id^='load_'").each(function(i, el){
			var cid = $(this).data('cid');//cc_id.line
			var cdc = $(this).data('cdc');//content
			var cdo = $(this).data('cdo');//origin
			test_diff(cid,cdc,cdo);
		});		
	});
</script>