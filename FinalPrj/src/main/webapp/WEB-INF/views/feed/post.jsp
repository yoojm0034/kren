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

.is-comment .media-content {
	line-height: 1.6;
}

.card.is-post .comments-wrap .comments-body .is-comment .media-content a,
	.shop-wrapper .cart-container .cart-content .cart-summary .is-post.summary-card .comments-wrap .comments-body .is-comment .media-content a
	{
	display: inline;
	font-weight: 600 !important;
	font-size: 0.9rem;
}

.is-comment>.media-content>.time {
	display: inline !important;
	font-size: .8rem !important;
	color: #888da8;
	margin-bottom: 10px;
	margin-left: 0.5rem;
}

.media-content>div>pre {
	background-color: transparent !important;
	color: unset;
	font-size: .875em;
	overflow-x: auto;
	padding: 0 !important;
	white-space: pre-wrap;
	word-wrap: normal;
	font-family: ONE-Mobile-Regular;
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

<script
	src="${pageContext.request.contextPath}/resources/template/assets/css/app.css"></script>
<script
	src="${pageContext.request.contextPath}/resources/template/assets/css/core.css"></script>
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
							<img src="${pageContext.request.contextPath}/resources/upload/${vo.photo }"
								data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1"
								alt="" onclick="profile('${vo.user_id }')" style="cursor: pointer;">
						</div>
						<div class="user-info" onclick="profile('${vo.user_id }')">
							<a href="#" style="font-size: 1rem; display: inline">${vo.name }</a>
							<span class="time postTime"><fmt:formatDate
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
									<% pageContext.setAttribute("enter", "\r\n"); %>
										<c:set var="content" value="${vo.content }"/>
										<c:set var="text" value="${fn:replace(content,enter,' ')}"/>
										<i data-feather="bookmark"></i>
										<div class="media-content" id="${text }"
											onclick="trans('${vo.feed_id }','${text }'); return false;">
											<h3><spring:message code="feed.drop.trans"/></h3>
										</div>
									</div>
								</a>
								<c:if test="${vo.user_id ne user.user_id}">
									<a class="dropdown-item">
										<div class="media">
											<div class="media-content" id="feedcor"
												data-fid="${vo.feed_id }" data-fidx="${status.index }">
												<h3><spring:message code="feed.drop.corr"/></h3>
											</div>
										</div>
									</a>
									<hr class="dropdown-divider">
									<a class="dropdown-item">
										<div class="media">
											<div class="media-content" id="frbtn"
												data-repo2="${vo.feed_id }" data-report2="${vo.user_id }">
												<h3><spring:message code="feed.drop.report"/></h3>
											</div>
											<div class="dropdown-menu">
												<div class="dropdown-content reportMenu">
													<div class="media freport" style="border: 0px;">
														<table id="report-table">
															<tr>
																<td><input type="radio" id="fmsg"
																	name="${vo.feed_id }" value="?????? ?????????">
																	<spring:message code="feed.report.content"/></td>
															</tr>
															<tr>
																<td><input type="radio" id="fmsg"
																	name="${vo.feed_id }" value="???????????? ??????">
																	<spring:message code="feed.report.lie"/></td>
															</tr>
															<tr>
																<td><input type="radio" id="fmsg"
																	name="${vo.feed_id }" value="????????? ??????">
																	<spring:message code="feed.report.sexual"/></td>
															</tr>
															<tr>
																<td><input type="radio" id="fmsg"
																	name="${vo.feed_id }" value="???????????? ????????? ??????">
																	<spring:message code="feed.report.date"/></td>
															</tr>
															<tr>
																<td><input type="radio" id="fmsg"
																	name="${vo.feed_id }" value="??????/??????">
																	<spring:message code="feed.report.word"/></td>
															</tr>
															<tr>
																<td><input type="radio" id="fmsg"
																	name="${vo.feed_id }" value="??????">
																	<spring:message code="feed.report.etc"/></td>
															</tr>
															<tr>
																<td><input placeholder="????????????" hidden="true"
																	data-rftxt="${vo.feed_id }" maxlength="30"></input></td>
															</tr>
														</table>
													</div>
													<div class="dropdown-divider"></div>
													<div class="reported-div">
														<input type="checkbox" id="feed-blocked"
															data-rfchk="${vo.feed_id  }" value="${vo.user_id }">${vo.name }
														<spring:message code="feed.report.block"/>
														<button id="report-btn" data-repo2="${vo.feed_id  }"
															data-report2="${vo.user_id }">
															<spring:message code="feed.report.btn"/></button>
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
												<h3><spring:message code="feed.drop.update"/></h3>
											</div>
										</div> <a href="#" class="dropdown-item">
											<div class="media">
												<i data-feather="flag"></i>
												<div class="media-content delFeed" id="${vo.feed_id }">
													<h3><spring:message code="feed.drop.delete"/></h3>
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
						<p
							style="font-size: 1rem; color: #5f5f5f; line-height: 1.5; word-wrap: break-word; white-space: pre-line;">${vo.content }</p>
						<div class="tdiv" id="tdiv${vo.feed_id }"></div>
						<div class="twdiv" id="${vo.write_lan }"></div>
					</div>
					<div class="post-image">
						<img
							src='${pageContext.request.contextPath}/resources/upload/${vo.uuid}'
							alt="" />
					</div>
					<div>
						<p>
							<c:if test="${not empty vo.tags }">
								<c:forTokens items="${vo.tags }" delims="," var="item">
								    <a class="tag-label" id="${item}">#${item}</a>
								</c:forTokens>
							</c:if>
						</p>
					</div>
				</div>
				<!-- /Post body -->

				<!-- Post footer -->
				<div class="card-footer">
					<!-- Post statistics -->
					<div class="likers-group" id="likers-group${vo.feed_id }">
						<c:forTokens items="${vo.likersuuid }" delims="," var="item"
							end="4">
							<img
								src='${pageContext.request.contextPath}/resources/upload/${item}'
								data-demo-src="assets/img/avatars/dan.jpg"
								data-user-popover="1" alt="">
						</c:forTokens>
					</div>
					<!-- Followers text -->
					<div class="likers-text">
						<p class="likename${vo.feed_id }">
							<c:set var="cnt" value="1" />
							<c:forTokens items="${vo.likers }" delims="," var="item"
								end="1">
								<a class="originLikename${vo.feed_id }" href="#"
									id="${item}">${item}</a>
								<c:set var="sum" value="${cnt+1}" />
							</c:forTokens>
	
						</p>
						<c:if test="${vo.like_cnt gt 2 }">
							<p class="orginLikeText${vo.feed_id }"><spring:message code="feed.like.user1"/> ${vo.like_cnt - sum}
								<spring:message code="feed.like.user2"/></p>
						</c:if>
						<p class="likeText${vo.feed_id }"></p>
					</div>
					<div class="social-count">
						<!-- Action buttons -->
						<!-- /partials/pages/feed/buttons/feed-post-actions.html -->
						<!-- ?????? ????????? -->
						<div class="fab-wrapper is-comment" style="padding-right: 10px;">
							<a href="javascript:void(0);" class="small-fab"> <svg
									viewBox="0 0 24 24" width="24" height="24"
									stroke="currentColor" stroke-width="2" fill="none"
									stroke-linecap="round" stroke-linejoin="round"
									class="css-i6dzq1">
																<path
										d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
								<span class="activeCnt" id="minicmt"
								data-minicmt="${status.index }"> <c:if
										test="${vo.cmt eq 0 }">0</c:if> <c:if test="${vo.cmt gt 0 }">${vo.cmt }</c:if>
							</span>
							</a>
						</div>
						<!-- ????????? ????????? -->
						<div class="like-wrapper">
							<a class="like-button"
								onclick="likeIt('${vo.feed_id}','${vo.user_id }'); return false;">
								<i class="mdi mdi-heart not-liked bouncy"></i> <i
								class="mdi mdi-heart is-liked bouncy"></i> <span
								class="activeCnt" id="recCnt${vo.feed_id }">
									${vo.like_cnt } </span>
							</a>
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
						<spring:message code="comment.h4.title" />
						<small> <c:if test="${!empty vo.cmt and vo.cmt eq 0 }">(0)</c:if>
							<c:if test="${!empty vo.cmt and vo.cmt gt 0 }">(${vo.cmt})</c:if>
						</small>
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
				<div class="comments-body has-slimscroll"
					data-scroll="${status.index }">

					<!-- Comment -->
					<c:if test="${!empty vo.cmt and vo.cmt gt 0 }">
						<c:forEach items="${commentList }" var="cmt">
							<!-- ??????????????? ????????? -->
							<c:if test="${vo.feed_id eq cmt.feed_id }">
								<c:choose>
									<c:when test="${cmt.content ne '-'}">
										<!-- ?????????????????? -->
										<div class="media is-comment">
											<!-- User image -->
											<div class="media-left">
												<div class="image">
													<c:if test="${cmt.uuid ne '-' }">
														<img src="${pageContext.request.contextPath}/resources/upload/${cmt.uuid}"
															data-demo-src="assets/img/avatars/dan.jpg"
															data-user-popover="1" alt="">
													</c:if>
													<c:if test="${cmt.uuid eq '-' }">
														<img src="https://via.placeholder.com/300x300"
															data-demo-src="assets/img/avatars/dan.jpg"
															data-user-popover="1" alt="">
													</c:if>
												</div>
											</div>
											<!-- Content -->
											<div class="media-content">
												<a
													href="${pageContext.request.contextPath}/profile.do?user_id=${cmt.user_id }">${cmt.name }</a>
												<span class="time"> <span id="cmt${cmt.comment_id }">
														<fmt:formatDate value="${cmt.reg_date }"
															pattern="yyyy-MM-dd HH:mm:ss" />
												</span> <!-- Actions --> <c:if
														test="${cmt.user_id eq user.user_id }">
														<div class="controls" style="display: inline-block">
															<div class="edit">
																<a id="del" data-delcmt="${cmt.comment_id }"
																	data-delcmtfeed="${cmt.feed_id }"
																	data-idx="${status.index }"> <svg
																		viewBox="0 0 24 24" width="15" height="15"
																		stroke="currentColor" stroke-width="2" fill="none"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="css-i6dzq1">
									<line x1="18" y1="6" x2="6" y2="18"></line>
									<line x1="6" y1="6" x2="18" y2="18"></line></svg>
																</a>
															</div>
														</div>
													</c:if>
												</span>
												<p
													style="color: #525252; word-wrap: break-word; white-space: pre-line;">${cmt.content }
												</p>
											</div>
											<c:if
												test="${user.user_id ne cmt.user_id and cmt.user_id ne 'admin'}">
												<!-- Right side dropdown -->
												<div class="media-right">
													<div
														class="dropdown is-spaced is-right is-neutral dropdown-trigger">
														<div>
															<div class="button">
																<svg viewBox="0 0 24 24" width="24" height="24"
																	stroke="currentColor" stroke-width="2" fill="none"
																	stroke-linecap="round" stroke-linejoin="round"
																	class="css-i6dzq1">
                                    <path
																		d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                                    <line x1="12" y1="9" x2="12" y2="13"></line>
                                    <line x1="12" y1="17" x2="12.01"
																		y2="17"></line></svg>
															</div>
														</div>
														<div class="dropdown-menu" role="menu">
															<div class="dropdown-content">
																<div class="media">
																	<table>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="?????? ?????????">
																				<spring:message code="comment.report.content" /></label></td>
																		</tr>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="???????????? ??????">
																				<spring:message code="comment.report.lie" /></label></td>
																		</tr>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="????????? ??????">
																				<spring:message code="comment.report.sexual" /></label></td>
																		</tr>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="???????????? ????????? ??????">
																				<spring:message code="letter.report.date" /></label></td>
																		</tr>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="??????/??????">
																				<spring:message code="letter.report.word" /></label></td>
																		</tr>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="??????">
																				<spring:message code="letter.report.etc" /></label></td>
																		</tr>
																		<tr>
																			<td><spring:message
																					code="comment.report.input.placeholder"
																					var="cmt_placeholder" /> <input
																				data-rtxt="${cmt.comment_id }"
																				placeholder="${cmt_placeholder }" hidden="true"
																				maxlength="30"></input></td>
																		</tr>
																	</table>
																</div>
																<div class="dropdown-divider"></div>
																<input type="checkbox" id="blocked"
																	data-rchk="${cmt.comment_id  }" value="${cmt.user_id }">${cmt.name }
																<spring:message code="comment.report.block" />
																<button id="fr-btn" data-repo="${cmt.comment_id  }"
																	data-report="${cmt.user_id }">
																	<spring:message code="comment.report.btn" />
																</button>
															</div>
														</div>
													</div>
												</div>
												<!-- /Right side dropdown -->
											</c:if>
										</div>
										<!-- /?????????????????? -->
									</c:when>
									<c:otherwise>
										<!-- ?????????????????? -->
										<div class="media is-comment">
											<!-- User image -->
											<div class="media-left">
												<div class="image">
													<c:if test="${cmt.uuid ne '-' }">
														<img src="${pageContext.request.contextPath}/resources/upload/${cmt.uuid}"
															data-demo-src="assets/img/avatars/dan.jpg"
															data-user-popover="1" alt="">
													</c:if>
													<c:if test="${cmt.uuid eq '-' }">
														<img src="https://via.placeholder.com/300x300"
															data-demo-src="assets/img/avatars/dan.jpg"
															data-user-popover="1" alt="">
													</c:if>
												</div>
											</div>
											<!-- Content -->
											<div class="media-content">
												<a
													href="${pageContext.request.contextPath}/profile.do?user_id=${cmt.user_id }">${cmt.name }</a>
												<span class="time"> <span id="cmt${cmt.comment_id }">
														<fmt:formatDate value="${cmt.reg_date }"
															pattern="yyyy-MM-dd HH:mm:ss" />
												</span> <!-- Actions --> <c:if
														test="${cmt.user_id eq user.user_id }">
														<div class="controls" style="display: inline-block">
															<div class="edit">
																<a id="cdel" data-delcmt="${cmt.comment_id }"
																	data-delcmtfeed="${cmt.feed_id }"
																	data-idx="${status.index }"> <svg
																		viewBox="0 0 24 24" width="15" height="15"
																		stroke="currentColor" stroke-width="2" fill="none"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="css-i6dzq1">
																		<line x1="18" y1="6" x2="6" y2="18"></line>
																		<line x1="6" y1="6" x2="18" y2="18"></line></svg>
																</a>
															</div>
														</div>
													</c:if>
												</span>
												<!-- ??????????????????, line??? ?????? -->
												<c:forEach items="${cdList }" var="cd" varStatus="stat">
													<c:if test="${cmt.comment_id eq cd.cc_id }">
														<div id="load_${cd.cc_id }${cd.line}"
															data-cid="${cd.cc_id }${cd.line}"
															data-cdc="${cd.content }" data-cdo="${cd.origin }">${cd.content }</div>
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
																<svg viewBox="0 0 24 24" width="24" height="24"
																	stroke="currentColor" stroke-width="2" fill="none"
																	stroke-linecap="round" stroke-linejoin="round"
																	class="css-i6dzq1">
                                    <path
																		d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                                    <line x1="12" y1="9" x2="12" y2="13"></line>
                                    <line x1="12" y1="17" x2="12.01"
																		y2="17"></line></svg>
															</div>
														</div>
														<div class="dropdown-menu" role="menu">
															<div class="dropdown-content">
																<div class="media">
																	<table>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="?????? ?????????">
																				<spring:message code="comment.report.content" /></label></td>
																		</tr>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="???????????? ??????">
																				<spring:message code="comment.report.lie" /></label></td>
																		</tr>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="????????? ??????">
																				<spring:message code="comment.report.sexual" /></label></td>
																		</tr>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="???????????? ????????? ??????">
																				<spring:message code="letter.report.date" /></label></td>
																		</tr>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="??????/??????">
																				<spring:message code="letter.report.word" /></label></td>
																		</tr>
																		<tr>
																			<td><label><input type="radio" id="msg"
																					name="${cmt.comment_id }" value="??????">
																				<spring:message code="letter.report.etc" /></label></td>
																		</tr>
																		<tr>
																			<td><spring:message
																					code="comment.report.input.placeholder"
																					var="cmt_placeholder" /> <input
																				data-rtxt="${cmt.comment_id }"
																				placeholder="${cmt_placeholder}" hidden="true"
																				maxlength="30"></input></td>
																		</tr>
																	</table>
																</div>
																<div class="dropdown-divider"></div>
																<input type="checkbox" id="blocked"
																	data-rchk="${cmt.comment_id  }" value="${cmt.user_id }">${cmt.name }
																<spring:message code="comment.report.block" />
																<button id="fr-btn" data-repo="${cmt.comment_id  }"
																	data-report="${cmt.user_id }">
																	<spring:message code="comment.report.block" />
																</button>
															</div>
														</div>
													</div>
												</div>
												<!-- /Right side dropdown -->
											</c:if>
										</div>
										<!-- /?????????????????? -->
									</c:otherwise>
								</c:choose>
							</c:if>
							<!-- /??????????????? ????????? -->
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
									<spring:message code="comment.textarea.placeholder"
										var="cmt_text_placeholder" />
									<textarea data-content="${vo.feed_id }"
										class="textarea comment-textarea" rows="5"
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
									<a class="button is-solid primary-button raised" id="post"
										data-feedid="${vo.feed_id }" data-feeduser="${vo.user_id }"
										data-scr="${status.index }"> <spring:message
											code="comment.btn.send" />
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
	<!------------------------ ????????? ??? ------------------------->
	<div class=" load-more-wrap narrow-top has-text-centered"
		id="buttonToogle">
		<a href="javascript:;" class="load-more-button"><spring:message code="feed.loadmore"/></a>
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

	// ????????? ??????; diffButty.js; String
	function test_diff(cid, dif, ori) {
		var original = ori;
		var revised = dif;
		var output = $('<pre>');
		var html = diffButty(original, revised);
		output.html(html);
		var div = $('div[data-cid="' + cid + '"]');
		div.html(output);
	}

	$(function() {
		$("div[id^='load_'").each(function(i, el) {
			var cid = $(this).data('cid');//cc_id.line
			var cdc = $(this).data('cdc');//content
			var cdo = $(this).data('cdo');//origin
			test_diff(cid, cdc, cdo);
		});
	});
</script>