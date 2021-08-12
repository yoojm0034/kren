<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/template/assets/js/global.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/assets/js/app.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/assets/js/webcam.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/assets/js/compose.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/assets/js/autocompletes.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/assets/js/tour.js"></script>

<script>
	
</script>
<div class="feedContents">
	<c:forEach items="${feedList }" var="vo">
		<div id="feed-post-1" class="card is-post">
			<!-- Main wrap -->
			<div class="content-wrap">
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
							<a href="#">${vo.name } <svg viewBox="0 0 24 24" width="21" height="15" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M12 19l7-7 3 3-7 7-3-3z"></path><path d="M18 13l-1.5-7.5L2 2l3.5 14.5L13 18l5-5z"></path><path d="M2 2l7.586 7.586"></path><circle cx="11" cy="11" r="2"></circle></svg>
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
								</a> <a class="dropdown-item">
									<div class="media">
										<i data-feather="bell"></i>
										<div class="media-content">
											<h3>교정</h3>
										</div>
									</div>
								</a>
								<c:if test="${vo.user_id ne user.user_id}">
									<hr class="dropdown-divider">
									<a class="dropdown-item">
										<div class="media">
											<div class="media-content" id="frbtn"
												data-repo="${vo.feed_id }" data-report="${vo.user_id }">
												<h3>신고</h3>
											</div>
										
										<div class="dropdown-menu">
											<div class="dropdown-content reportMenu">
												<div class="media freport" style="border: 0px;">
													<table>
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
												<input type="checkbox" id="feed-blocked"
													data-rfchk="${vo.feed_id  }" value="${vo.user_id }">${vo.name }
												차단
												<button id="report-btn" data-repo="${vo.feed_id  }"
													data-report="${vo.user_id }">신고</button>
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
												<div class="media-content"
													onclick="location.href='feedDelete.do?feed_id=${vo.feed_id }'">
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
						<p>${vo.content }</p>
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
							<div class="fab-wrapper is-comment" onclick="initPostComments()">
								<a href="javascript:void(0);" class="small-fab"> <svg
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
							<div class="fab-wrapper is-comment" onclick="initPostComments()">
								<a href="javascript:void(0);" class="small-fab"> <svg
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
					<!-- Followers avatars -->
					<div class="likers-group">
						<img src="https://via.placeholder.com/300x300"
							data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1"
							alt=""> <img src="https://via.placeholder.com/300x300"
							data-demo-src="assets/img/avatars/david.jpg"
							data-user-popover="4" alt=""> <img
							src="https://via.placeholder.com/300x300"
							data-demo-src="assets/img/avatars/edward.jpeg"
							data-user-popover="5" alt=""> <img
							src="https://via.placeholder.com/300x300"
							data-demo-src="assets/img/avatars/milly.jpg"
							data-user-popover="7" alt="">
					</div>

					<!-- Followers text -->
					<div class="likers-text">
						<p></p>
					</div>

					<!-- Post statistics -->
					<div class="social-count">
						<div class="comments-count">
							<svg viewBox="0 0 24 24" width="24" height="24"
								stroke="currentColor" stroke-width="2" fill="none"
								stroke-linecap="round" stroke-linejoin="round"
								class="css-i6dzq1">
								<path
									d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
							<span>3</span>
						</div>
						<div class="likes-count" id="like-count${vo.feed_id }">
							<svg viewBox="0 0 24 24" width="24" height="24"
								stroke="currentColor" stroke-width="2" fill="none"
								stroke-linecap="round" stroke-linejoin="round"
								class="css-i6dzq1">
								<path
									d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
							<span id="recCnt${vo.feed_id }"> ${vo.like_cnt } </span>
						</div>
					</div>
				</div>
				<!-- /Post footer -->
			</div>
			<!-- /Main wrap -->

			<!-- Post #1 Comments -->
			<div class="comments-wrap is-hidden">
				<!-- Header -->
				<div class="comments-heading">
					<h4>
						Comments <small>(8)</small>
					</h4>
					<div class="close-comments">
						<svg viewBox="0 0 24 24" width="24" height="24"
							stroke="currentColor" stroke-width="2" fill="none"
							stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
							<line x1="18" y1="6" x2="6" y2="18"></line>
							<line x1="6" y1="6" x2="18" y2="18"></line></svg>
					</div>
				</div>
				<!-- /Header -->

				<!-- Comments body -->
				<div class="comments-body has-slimscroll">

					<!-- Comment -->
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
							<a href="#">Dan Walker</a> <span class="time">28 minutes
								ago</span>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempo incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris consequat.</p>
							<!-- Actions -->
							<div class="controls">
								<div class="like-count">
									<i data-feather="thumbs-up"></i> <span>4</span>
								</div>
								<div class="reply">
									<a href="#">Reply</a>
								</div>
								<div class="edit">
									<a href="#">Edit</a>
								</div>
							</div>

							<!-- Nested Comment -->
							<div class="media is-comment">
								<!-- User image -->
								<div class="media-left">
									<div class="image">
										<img src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/david.jpg"
											data-user-popover="4" alt="">
									</div>
								</div>
								<!-- Content -->
								<div class="media-content">
									<a href="#">David Kim</a> <span class="time">15 minutes
										ago</span>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempo incididunt ut labore et dolore
										magna aliqua.</p>
									<!-- Actions -->
									<div class="controls">
										<div class="like-count">
											<i data-feather="thumbs-up"></i> <span>0</span>
										</div>
										<div class="reply">
											<a href="#">Reply</a>
										</div>
									</div>
								</div>
								<!-- Right side dropdown -->
								<div class="media-right">
									<div
										class="dropdown is-spaced is-right is-neutral dropdown-trigger">
										<div>
											<div class="button">
												<i data-feather="more-vertical"></i>
											</div>
										</div>
										<div class="dropdown-menu" role="menu">
											<div class="dropdown-content">
												<a class="dropdown-item">
													<div class="media">
														<i data-feather="x"></i>
														<div class="media-content">
															<h3>Hide</h3>
															<small>Hide this comment.</small>
														</div>
													</div>
												</a>
												<div class="dropdown-divider"></div>
												<a href="#" class="dropdown-item">
													<div class="media">
														<i data-feather="flag"></i>
														<div class="media-content">
															<h3>Report</h3>
															<small>Report this comment.</small>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Nested Comment -->

						</div>
						<!-- Right side dropdown -->
						<div class="media-right">
							<!-- /partials/pages/feed/dropdowns/comment-dropdown.html -->
							<div
								class="dropdown is-spaced is-right is-neutral dropdown-trigger">
								<div>
									<div class="button">
										<i data-feather="more-vertical"></i>
									</div>
								</div>
								<div class="dropdown-menu" role="menu">
									<div class="dropdown-content">
										<a class="dropdown-item">
											<div class="media">
												<i data-feather="x"></i>
												<div class="media-content">
													<h3>Hide</h3>
													<small>Hide this comment.</small>
												</div>
											</div>
										</a>
										<div class="dropdown-divider"></div>
										<a href="#" class="dropdown-item">
											<div class="media">
												<i data-feather="flag"></i>
												<div class="media-content">
													<h3>Report</h3>
													<small>Report this comment.</small>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /Comment -->

					<!-- Comment -->
					<div class="media is-comment">
						<!-- User image -->
						<div class="media-left">
							<div class="image">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="assets/img/avatars/rolf.jpg"
									data-user-popover="13" alt="">
							</div>
						</div>
						<!-- Content -->
						<div class="media-content">
							<a href="#">Rolf Krupp</a> <span class="time">9 hours ago</span>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempo incididunt ut labore et dolore magna
								aliqua. Exercitation ullamco laboris consequat.</p>
							<!-- Actions -->
							<div class="controls">
								<div class="like-count">
									<i data-feather="thumbs-up"></i> <span>2</span>
								</div>
								<div class="reply">
									<a href="#">Reply</a>
								</div>
							</div>

							<!-- Nested Comment -->
							<div class="media is-comment">
								<!-- User image -->
								<div class="media-left">
									<div class="image">
										<img src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/elise.jpg"
											data-user-popover="6" alt="">
									</div>
								</div>
								<!-- Content -->
								<div class="media-content">
									<a href="#">Elise Walker</a> <span class="time">8 hours
										ago</span>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempo incididunt ut labore et dolore
										magna aliqua.</p>
									<!-- Actions -->
									<div class="controls">
										<div class="like-count">
											<i data-feather="thumbs-up"></i> <span>0</span>
										</div>
										<div class="reply">
											<a href="#">Reply</a>
										</div>
									</div>
								</div>
								<!-- Right side dropdown -->
								<div class="media-right">
									<div
										class="dropdown is-spaced is-right is-neutral dropdown-trigger">
										<div>
											<div class="button">
												<i data-feather="more-vertical"></i>
											</div>
										</div>
										<div class="dropdown-menu" role="menu">
											<div class="dropdown-content">
												<a class="dropdown-item">
													<div class="media">
														<i data-feather="x"></i>
														<div class="media-content">
															<h3>Hide</h3>
															<small>Hide this comment.</small>
														</div>
													</div>
												</a>
												<div class="dropdown-divider"></div>
												<a href="#" class="dropdown-item">
													<div class="media">
														<i data-feather="flag"></i>
														<div class="media-content">
															<h3>Report</h3>
															<small>Report this comment.</small>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Nested Comment -->

							<!-- Nested Comment -->
							<div class="media is-comment">
								<!-- User image -->
								<div class="media-left">
									<div class="image">
										<img src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/rolf.jpg"
											data-user-popover="13" alt="">
									</div>
								</div>
								<!-- Content -->
								<div class="media-content">
									<a href="#">Rolf Krupp</a> <span class="time">7 hours
										ago</span>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempo incididunt ut labore et dolore
										magna aliqua.</p>
									<!-- Actions -->
									<div class="controls">
										<div class="like-count">
											<i data-feather="thumbs-up"></i> <span>1</span>
										</div>
										<div class="reply">
											<a href="#">Reply</a>
										</div>
									</div>
								</div>
								<!-- Right side dropdown -->
								<div class="media-right">
									<div
										class="dropdown is-spaced is-right is-neutral dropdown-trigger">
										<div>
											<div class="button">
												<i data-feather="more-vertical"></i>
											</div>
										</div>
										<div class="dropdown-menu" role="menu">
											<div class="dropdown-content">
												<a class="dropdown-item">
													<div class="media">
														<i data-feather="x"></i>
														<div class="media-content">
															<h3>Hide</h3>
															<small>Hide this comment.</small>
														</div>
													</div>
												</a>
												<div class="dropdown-divider"></div>
												<a href="#" class="dropdown-item">
													<div class="media">
														<i data-feather="flag"></i>
														<div class="media-content">
															<h3>Report</h3>
															<small>Report this comment.</small>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Nested Comment -->

							<!-- Nested Comment -->
							<div class="media is-comment">
								<!-- User image -->
								<div class="media-left">
									<div class="image">
										<img src="https://via.placeholder.com/300x300"
											data-demo-src="assets/img/avatars/elise.jpg"
											data-user-popover="6" alt="">
									</div>
								</div>
								<!-- Content -->
								<div class="media-content">
									<a href="#">Elise Walker</a> <span class="time">6 hours
										ago</span>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempo incididunt ut labore et dolore
										magna aliqua.</p>
									<!-- Actions -->
									<div class="controls">
										<div class="like-count">
											<i data-feather="thumbs-up"></i> <span>0</span>
										</div>
										<div class="reply">
											<a href="#">Reply</a>
										</div>
									</div>
								</div>
								<!-- Right side dropdown -->
								<div class="media-right">
									<div
										class="dropdown is-spaced is-right is-neutral dropdown-trigger">
										<div>
											<div class="button">
												<i data-feather="more-vertical"></i>
											</div>
										</div>
										<div class="dropdown-menu" role="menu">
											<div class="dropdown-content">
												<a class="dropdown-item">
													<div class="media">
														<i data-feather="x"></i>
														<div class="media-content">
															<h3>Hide</h3>
															<small>Hide this comment.</small>
														</div>
													</div>
												</a>
												<div class="dropdown-divider"></div>
												<a href="#" class="dropdown-item">
													<div class="media">
														<i data-feather="flag"></i>
														<div class="media-content">
															<h3>Report</h3>
															<small>Report this comment.</small>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Nested Comment -->

						</div>
						<!-- Right side dropdown -->
						<div class="media-right">
							<div
								class="dropdown is-spaced is-right is-neutral dropdown-trigger">
								<div>
									<div class="button">
										<i data-feather="more-vertical"></i>
									</div>
								</div>
								<div class="dropdown-menu" role="menu">
									<div class="dropdown-content">
										<a class="dropdown-item">
											<div class="media">
												<i data-feather="x"></i>
												<div class="media-content">
													<h3>Hide</h3>
													<small>Hide this comment.</small>
												</div>
											</div>
										</a>
										<div class="dropdown-divider"></div>
										<a href="#" class="dropdown-item">
											<div class="media">
												<i data-feather="flag"></i>
												<div class="media-content">
													<h3>Report</h3>
													<small>Report this comment.</small>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /Comment -->

					<!-- Comment -->
					<div class="media is-comment">
						<!-- User image -->
						<div class="media-left">
							<div class="image">
								<img src="https://via.placeholder.com/300x300"
									data-demo-src="assets/img/avatars/lana.jpeg"
									data-user-popover="10" alt="">
							</div>
						</div>
						<!-- Content -->
						<div class="media-content">
							<a href="#">Lana Henrikssen</a> <span class="time">10
								hours ago</span>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempo incididunt ut labore et dolore magna
								aliqua.</p>
							<!-- Comment actions -->
							<div class="controls">
								<div class="like-count">
									<i data-feather="thumbs-up"></i> <span>5</span>
								</div>
								<div class="reply">
									<a href="#">Reply</a>
								</div>
							</div>
						</div>
						<!-- Right side dropdown -->
						<div class="media-right">
							<div
								class="dropdown is-spaced is-right is-neutral dropdown-trigger">
								<div>
									<div class="button">
										<i data-feather="more-vertical"></i>
									</div>
								</div>
								<div class="dropdown-menu" role="menu">
									<div class="dropdown-content">
										<a class="dropdown-item">
											<div class="media">
												<i data-feather="x"></i>
												<div class="media-content">
													<h3>Hide</h3>
													<small>Hide this comment.</small>
												</div>
											</div>
										</a>
										<div class="dropdown-divider"></div>
										<a href="#" class="dropdown-item">
											<div class="media">
												<i data-feather="flag"></i>
												<div class="media-content">
													<h3>Report</h3>
													<small>Report this comment.</small>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
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
									<textarea class="textarea comment-textarea" rows="5"
										placeholder="Write a comment..."></textarea>
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
									<div class="action is-auto">
										<i data-feather="at-sign"></i>
									</div>
									<div class="action is-emoji">
										<i data-feather="smile"></i>
									</div>
									<div class="action is-upload">
										<i data-feather="camera"></i>
									</div>
									<a class="button is-solid primary-button raised">Post
										Comment</a>
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
</script>