<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.inbox-wrapper .inbox-wrapper-inner .inbox-left-sidebar .inbox-left-sidebar-inner {
    width: 100%;
    height: 100%;
    padding: 8%;
}

.inbox-wrapper .inbox-wrapper-inner .inbox-center-container .inbox-center-container-inner .messages .action-buttons .button {
    max-height: 32px;
    padding: 4px 8px;
    margin-top: 10px;
}

.inbox-wrapper .inbox-wrapper-inner .inbox-message-container .inbox-message-container-inner .message-head .action-buttons .button {
    max-height: 32px;
    padding: 4px 8px;
    margin-top: 10px;
}
</style>
<body>
    <div class="inbox-wrapper">
        <div class="inbox-wrapper-inner">
            <!-- /partials/pages/inbox/inbox-sidebar.html -->
            <!-- Inbox left Sidebar  -->
            <div class="inbox-left-sidebar">
                <div class="inbox-left-sidebar-inner ">
                    <!-- Compose button -->
                    <div class="compose">
                        <a class="button is-fullwidth raised is-bold">Write</a>
                    </div>
                    <!-- Menu -->
                    <div class="left-menu">
                        <a href="letterBox.do" class="item">
                            <i data-feather="mail"></i>
                            <span class="name">New Letters</span>
                        </a>
                        <a href="arriveLetter" class="item">
                            <i data-feather="star"></i>
                            <span class="name">Arrive Letters</span>
                        </a>
                        <a href="savedLetter.do" class="item is-active">
                            <i data-feather="folder"></i>
                            <span class="name">Saved Letters</span>
                        </a>
                    </div>
                    <!-- Mobile only close -->
                    <div class="close-menu is-hidden-desktop is-hidden-landscape">
                        <a id="close-compose"><i data-feather="arrow-left"></i> Close</a>
                    </div>
                </div>
            </div>
            <!-- Messages list container -->
            <!-- /partials/pages/inbox/inbox-center-container.html -->
            <div class="inbox-center-container is-both-opened">
                <div class="inbox-center-container-inner">
                    <div class="messages">
                        <!-- Button group -->
                        <div class="action-buttons">
                            <div class="control is-grouped is-hidden-desktop is-hidden-landscape">
								<a id="open-compose" class="button is-solo">
									<svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-menu">
										<line x1="3" y1="12" x2="21" y2="12"></line>
										<line x1="3" y1="6" x2="21" y2="6"></line>
										<line x1="3" y1="18" x2="21" y2="18"></line>
									</svg>
								</a>
							</div>
                            <div class="control is-grouped">
								<a class="button" href="letterBox.do">
									<svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-refresh-cw">
										<polyline points="23 4 23 10 17 10"></polyline>
										<polyline points="1 20 1 14 7 14"></polyline>
										<path
											d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
									</svg>
								</a>
							</div>
                            <div class="control is-grouped">
								<a class="button">
									<svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-star">
										<polygon
										points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
									</svg>
								</a>
								<a class="button">
									<svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-inbox">
										<polyline points="22 12 16 12 14 15 10 15 8 12 2 12"></polyline>
										<path
											d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"></path>
									</svg>
								</a>
							</div>
                            <div class="control is-grouped is-arrows">
								<a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-chevron-left">
										<polyline points="15 18 9 12 15 6"></polyline></svg>
								</a>
								<a class="button"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-chevron-right">
										<polyline points="9 18 15 12 9 6"></polyline></svg>
								</a>
								<span class="message-count" style="vertical-align: bottom;">1-10 of 123</span>
                            </div>
                        </div>
                        <!-- Messages list -->
                        <div id="inbox-messages" class="inbox-messages has-slimscroll">
                            <div class="inbox-messages-inner">
                            <!-- Message cards -->
                                <!-- Message card -->
                                <div id="msg-card-0" data-preview-id="0" class="card is-msg has-attachment is-active">
                                    <div class="card-content">
                                        <div class="msg-header">
                                            <span class="msg-from">
                                                    <small>From: <a>@Dan</a></small>
                                                </span>
                                            <span class="msg-attachment">
                                                    <i data-feather="paperclip"></i>
                                                </span>
                                            <span class="msg-timestamp">oct 23 2018</span>
                                        </div>
                                        <div class="msg-subject" style="text-align: right;">
                                            <span>letter status()</span>
                                        </div>
                                        <div class="msg-snippet">
                                            <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Message card -->

                                <!-- Message card -->
                                <div id="msg-card-1" data-preview-id="1" class="card is-msg">
                                    <div class="card-content">
                                        <div class="msg-header">
                                            <span class="msg-from">
                                                    <small>From: <a>@Nelly</a></small>
                                                </span>
                                            <span class="msg-attachment">
                                                    <i data-feather="paperclip"></i>
                                                </span>
                                            <span class="msg-timestamp">oct 19 2018</span>
                                        </div>
                                        <div class="msg-subject">
                                            <i data-feather="star"></i>
                                            <span>Send me the files</span>
                                        </div>
                                        <div class="msg-snippet">
                                            <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Message card -->

                                <!-- Message card -->
                                <div id="msg-card-2" data-preview-id="2" class="card is-msg">
                                    <div class="card-content">
                                        <div class="msg-header">
                                            <span class="msg-from">
                                                    <small>From: <a>@Milly</a></small>
                                                </span>
                                            <span class="msg-attachment">
                                                    <i data-feather="paperclip"></i>
                                                </span>
                                            <span class="msg-timestamp">oct 18 2018</span>
                                        </div>
                                        <div class="msg-subject">
                                            <i data-feather="star"></i>
                                            <span>About friday night</span>
                                        </div>
                                        <div class="msg-snippet">
                                            <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Message card -->

                                <!-- Message card -->
                                <div id="msg-card-3" data-preview-id="3" class="card is-msg has-attachment">
                                    <div class="card-content">
                                        <div class="msg-header">
                                            <span class="msg-from">
                                                    <small>From: <a>@Dan</a></small>
                                                </span>
                                            <span class="msg-attachment">
                                                    <i data-feather="paperclip"></i>
                                                </span>
                                            <span class="msg-timestamp">oct 12 2018</span>
                                        </div>
                                        <div class="msg-subject">
                                            <i data-feather="star"></i>
                                            <span>Angular Books</span>
                                        </div>
                                        <div class="msg-snippet">
                                            <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Message card -->


                                <!-- Message card -->
                                <div id="msg-card-4" data-preview-id="4" class="card is-msg has-attachment">
                                    <div class="card-content">
                                        <div class="msg-header">
                                            <span class="msg-from">
                                                    <small>From: <a>@David</a></small>
                                                </span>
                                            <span class="msg-attachment">
                                                    <i data-feather="paperclip"></i>
                                                </span>
                                            <span class="msg-timestamp">oct 10 2018</span>
                                        </div>
                                        <div class="msg-subject">
                                            <i data-feather="star"></i>
                                            <span>Starcraft 2 videos</span>
                                        </div>
                                        <div class="msg-snippet">
                                            <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Message card -->
                            </div>
                        </div>
                        <!-- /Message List -->
                    </div>
                </div>
            </div>
            <!-- Messages preview -->
            <!-- /partials/pages/inbox/inbox-message-container.html -->
            <!-- Message Preview -->
            <div class="inbox-message-container">
                <div class="inbox-message-container-inner">
                    <div class="message-head">
                        <!-- Button group -->
                        <div class="action-buttons">
                            <div class="control is-grouped">
								<a class="button">
									<svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-refresh-cw">
										<polyline points="23 4 23 10 17 10"></polyline>
										<polyline points="1 20 1 14 7 14"></polyline>
										<path
											d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
									</svg>
								</a>
							</div>
                            <div class="control is-grouped">
								<a class="button">
									<svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-star">
										<polygon
										points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
									</svg>
								</a>
								<a class="button">
									<svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-inbox">
										<polyline points="22 12 16 12 14 15 10 15 8 12 2 12"></polyline>
										<path
											d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"></path>
									</svg>
								</a>
							</div>
                            <div class="control is-grouped is-arrows">
								<a class="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-chevron-left">
										<polyline points="15 18 9 12 15 6"></polyline></svg>
								</a>
								<a class="button"> <svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-chevron-right">
										<polyline points="9 18 15 12 9 6"></polyline></svg>
								</a>
                            </div>
                            <!-- Hidden on desktop, controls mobile left and right sidebars -->
                            <div class="control is-grouped is-hidden-desktop is-hidden-landscape">
								<a id="close-inbox-preview" class="button is-solo">
									<svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-x">
										<line x1="18" y1="6" x2="6" y2="18"></line>
										<line x1="6" y1="6" x2="18" y2="18"></line>
									</svg>
								</a>
							</div>
                        </div>
                    </div>

                    <!-- Message Previews -->
                    <div class="message-body has-slimscroll">

                        <!-- Message 0 preview -->
                        <!-- /partials/pages/inbox/message-previews/message-preview-0.html -->
                        <div id="message-preview-0" class="message-body-inner is-active">
                            <div class="box message-preview">
                                <div class="box-inner">
                                    <div class="header">
                                        <div class="avatar">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" data-user-popover="1">
                                        </div>
                                        <div class="meta">
                                            <div class="name">Dan Walker</div>
                                            <div class="date">oct 23 2018, 01:02pm</div>
                                        </div>
                                        <div class="meta-right">
                                            <div>
                                                <span class="tag is-important">Important</span>
                                            </div>
                                            <div>
                                                <i data-feather="paperclip"></i>
                                                <small>2 attachments</small>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="content">
                                        <p>Hi there!</p>
                                        <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium
                                            animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.
                                        </p>
                                        <p>Natus vel ipsam suscipit est possimus qui quia. Distinctio aspernatur quia tenetur harum. Tempore qui
                                            aut ratione earum quia nam. Et asperiores officiis delectus. Optio quisquam nulla. </p>
                                        <p>Sincerely, <br>Dan.</p>
                                    </div>
                                    <div class="has-text-right">
                                        <a class="button is-solid grey-button is-bold raised">Reply to Message</a>
                                    </div>
                                </div>
                            </div>

                            <div class="attachments">
                                <div class="attachments-header">
                                    <div class="paperclip">
                                        <i data-feather="paperclip"></i>
                                    </div>
                                </div>
                                <div class="attachments-inner">
                                    <div class="box has-file img">
                                        <div class="box-inner">
                                            <i data-feather="image"></i>
                                            <h5>cover.jpg</h5>
                                        </div>
                                        <div class="actions-group">
                                            <a class="action">
                                                <i data-feather="download"></i>
                                            </a>
                                            <a class="action">
                                                <i data-feather="maximize"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="box has-file sheet">
                                        <div class="box-inner">
                                            <i data-feather="file-text"></i>
                                            <h5>project_budget.xlsx</h5>
                                        </div>
                                        <div class="actions-group">
                                            <a class="action">
                                                <i data-feather="download"></i>
                                            </a>
                                            <a class="action">
                                                <i data-feather="arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="box has-file doc">
                                        <div class="box-inner">
                                            <i data-feather="file-text"></i>
                                            <h5>project_abstract.docx</h5>
                                        </div>
                                        <div class="actions-group">
                                            <a class="action">
                                                <i data-feather="download"></i>
                                            </a>
                                            <a class="action">
                                                <i data-feather="arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="reply-wrapper">
                                <div class="reply-title">
                                    Reply to conversation
                                    <i data-feather="help-circle" class="has-tip"></i>
                                    <!-- Title Popover -->
                                    <div class="webui-popover-content">
                                        <div class="popover-flex-block">
                                            <div class="icon-block">
                                                <i data-feather="info"></i>
                                            </div>
                                            <div class="content-block">
                                                <span>Format message, </span>
                                                <span>Select the text you want to edit to make the toolbar appear.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="reply-wrapper-inner">
                                    <div class="flex-form">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="">
                                        <div class="control">
                                            <div class="reply-textarea"></div>
                                        </div>
                                    </div>
                                    <div class="has-text-right">
                                        <button type="button" class="button is-solid accent-button is-bold raised send-message">Send
                                            Message</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Message 1 preview -->
                        <!-- /partials/pages/inbox/message-previews/message-preview-1.html -->
                        <div id="message-preview-1" class="message-body-inner">
                            <div class="box message-preview">
                                <div class="box-inner">
                                    <div class="header">
                                        <div class="avatar">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" alt="" data-user-popover="9">
                                        </div>
                                        <div class="meta">
                                            <div class="name">Nelly Schwartz</div>
                                            <div class="date">oct 19 2018, 09:32am</div>
                                        </div>
                                        <div class="meta-right">
                                            <div>
                                                <span class="tag is-important">Important</span>
                                            </div>
                                            <div class="is-vhidden">
                                                <i data-feather="paperclip"></i>
                                                <small>2 attachments</small>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="content">
                                        <p>Hello Jenna,</p>
                                        <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium
                                            animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.
                                        </p>
                                        <p>Sincerely, <br>Nelly.</p>
                                    </div>
                                    <div class="has-text-right">
                                        <a class="button is-solid grey-button is-bold raised">Reply to Message</a>
                                    </div>
                                </div>
                            </div>

                            <div class="reply-wrapper">
                                <div class="reply-title">
                                    Reply to conversation
                                    <i data-feather="help-circle" class="has-tip"></i>
                                    <!-- Title Popover -->
                                    <div class="webui-popover-content">
                                        <div class="popover-flex-block">
                                            <div class="icon-block">
                                                <i data-feather="info"></i>
                                            </div>
                                            <div class="content-block">
                                                <span>Format message, </span>
                                                <span>Select the text you want to edit to make the toolbar appear.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="reply-wrapper-inner">
                                    <div class="flex-form">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="">
                                        <div class="control">
                                            <div class="reply-textarea"></div>
                                        </div>
                                    </div>
                                    <div class="has-text-right">
                                        <button type="button" class="button is-solid accent-button is-bold raised send-message">Send
                                            Message</button>
                                    </div>
                                </div>
                            </div>

                            <div class="message-preview-transition is-first">
                                <div class="mail">
                                    <i data-feather="mail"></i>
                                </div>
                            </div>

                            <div class="box message-preview">
                                <div class="box-inner">
                                    <div class="header">
                                        <div class="avatar">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="" data-user-popover="0">
                                        </div>
                                        <div class="meta">
                                            <div class="name">Jenna Davis</div>
                                            <div class="date">oct 18 2018, 08:19pm</div>
                                        </div>
                                        <div class="meta-right">
                                            <div>
                                                <span class="tag is-important">Important</span>
                                            </div>
                                            <div class="is-vhidden">
                                                <i data-feather="paperclip"></i>
                                                <small>2 attachments</small>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="content">
                                        <p>Hello Nelly,</p>
                                        <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium
                                            animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.
                                        </p>
                                        <p>Thanks, <br>Jenna.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="message-preview-transition">
                                <div class="mail">
                                    <i data-feather="mail"></i>
                                </div>
                            </div>

                            <div class="box message-preview">
                                <div class="box-inner">
                                    <div class="header">
                                        <div class="avatar">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" alt="" data-user-popover="9">
                                        </div>
                                        <div class="meta">
                                            <div class="name">Nelly Schwartz</div>
                                            <div class="date">oct 18 2018, 02:42pm</div>
                                        </div>
                                        <div class="meta-right">
                                            <div>
                                                <span class="tag is-important">Important</span>
                                            </div>
                                            <div class="is-vhidden">
                                                <i data-feather="paperclip"></i>
                                                <small>2 attachments</small>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="content">
                                        <p>Hi again Jenna,</p>
                                        <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium
                                            animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.
                                        </p>
                                        <p>Hope we will sort it out, <br>Nelly.</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Message 2 preview -->
                        <!-- /partials/pages/inbox/message-previews/message-preview-2.html -->
                        <div id="message-preview-2" class="message-body-inner">
                            <div class="box message-preview">
                                <div class="box-inner">
                                    <div class="header">
                                        <div class="avatar">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="" data-user-popover="7">
                                        </div>
                                        <div class="meta">
                                            <div class="name">Milly Augustine</div>
                                            <div class="date">oct 18 2018, 10:48pm</div>
                                        </div>
                                        <div class="meta-right">
                                            <div class="is-vhidden">
                                                <span class="tag is-important">Important</span>
                                            </div>
                                            <div class="is-vhidden">
                                                <i data-feather="paperclip"></i>
                                                <small>2 attachments</small>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="content">
                                        <p>Hey sweety,</p>
                                        <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium
                                            animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.
                                        </p>
                                        <p>I hope we will have fun, <br>Milly.</p>
                                    </div>
                                    <div class="has-text-right">
                                        <a class="button is-solid grey-button is-bold raised">Reply to Message</a>
                                    </div>
                                </div>
                            </div>


                            <div class="reply-wrapper">
                                <div class="reply-title">
                                    Reply to conversation
                                    <i data-feather="help-circle" class="has-tip"></i>
                                    <!-- Title Popover -->
                                    <div class="webui-popover-content">
                                        <div class="popover-flex-block">
                                            <div class="icon-block">
                                                <i data-feather="info"></i>
                                            </div>
                                            <div class="content-block">
                                                <span>Format message, </span>
                                                <span>Select the text you want to edit to make the toolbar appear.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="reply-wrapper-inner">
                                    <div class="flex-form">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="">
                                        <div class="control">
                                            <div class="reply-textarea"></div>
                                        </div>
                                    </div>
                                    <div class="has-text-right">
                                        <button type="button" class="button is-solid accent-button is-bold raised send-message">Send
                                            Message</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Message 3 preview -->
                        <!-- /partials/pages/inbox/message-previews/message-preview-3.html -->
                        <div id="message-preview-3" class="message-body-inner">
                            <div class="box message-preview">
                                <div class="box-inner">
                                    <div class="header">
                                        <div class="avatar">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" data-user-popover="1">
                                        </div>
                                        <div class="meta">
                                            <div class="name">Dan Walker</div>
                                            <div class="date">oct 12 2018, 05:12pm</div>
                                        </div>
                                        <div class="meta-right">
                                            <div class="is-vhidden">
                                                <span class="tag is-important">Important</span>
                                            </div>
                                            <div>
                                                <i data-feather="paperclip"></i>
                                                <small>2 attachments</small>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="content">
                                        <p>Hey Jenna!</p>
                                        <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium
                                            animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.
                                        </p>
                                        <p>See ya, <br>Dan.</p>
                                    </div>
                                    <div class="has-text-right">
                                        <a class="button is-solid grey-button is-bold raised">Reply to Message</a>
                                    </div>
                                </div>
                            </div>

                            <div class="attachments">
                                <div class="attachments-header">
                                    <div class="paperclip">
                                        <i data-feather="paperclip"></i>
                                    </div>
                                </div>
                                <div class="attachments-inner">
                                    <div class="box has-file pdf">
                                        <div class="box-inner">
                                            <i data-feather="file-text"></i>
                                            <h5>ng_book.pdf</h5>
                                        </div>
                                        <div class="actions-group">
                                            <a class="action">
                                                <i data-feather="download"></i>
                                            </a>
                                            <a class="action">
                                                <i data-feather="arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="box has-file slides">
                                        <div class="box-inner">
                                            <i data-feather="file-text"></i>
                                            <h5>ng_book2.opt</h5>
                                        </div>
                                        <div class="actions-group">
                                            <a class="action">
                                                <i data-feather="download"></i>
                                            </a>
                                            <a class="action">
                                                <i data-feather="arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="reply-wrapper">
                                <div class="reply-title">
                                    Reply to conversation
                                    <i data-feather="help-circle" class="has-tip"></i>
                                    <!-- Title Popover -->
                                    <div class="webui-popover-content">
                                        <div class="popover-flex-block">
                                            <div class="icon-block">
                                                <i data-feather="info"></i>
                                            </div>
                                            <div class="content-block">
                                                <span>Format message, </span>
                                                <span>Select the text you want to edit to make the toolbar appear.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="reply-wrapper-inner">
                                    <div class="flex-form">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="">
                                        <div class="control">
                                            <div class="reply-textarea"></div>
                                        </div>
                                    </div>
                                    <div class="has-text-right">
                                        <button type="button" class="button is-solid accent-button is-bold raised send-message">Send
                                            Message</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Message 4 preview -->
                        <!-- /partials/pages/inbox/message-previews/message-preview-4.html -->
                        <div id="message-preview-4" class="message-body-inner">
                            <div class="box message-preview">
                                <div class="box-inner">
                                    <div class="header">
                                        <div class="avatar">
                                            <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="" data-user-popover="4">
                                        </div>
                                        <div class="meta">
                                            <div class="name">David Kim</div>
                                            <div class="date">oct 10 2018, 7:13pm</div>
                                        </div>
                                        <div class="meta-right">
                                            <div class="is-vhidden">
                                                <span class="tag is-important">Important</span>
                                            </div>
                                            <div>
                                                <i data-feather="paperclip"></i>
                                                <small>3 attachments</small>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="content">
                                        <p>Hello Jenna</p>
                                        <p>Corporis tempora id quae fuga. Perspiciatis quam magnam dolores ut quia. Neque vero non laudantium
                                            animi omnis qui debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.
                                        </p>
                                        <p>Debitis minus molestias. Est ut minus est dolores quo harum illum suscipit cumque.</p>
                                        <p>Take care, <br>David.</p>
                                    </div>
                                    <div class="has-text-right">
                                        <a class="button is-solid grey-button is-bold raised">Reply to Message</a>
                                    </div>
                                </div>
                            </div>

                            <div class="attachments">
                                <div class="attachments-header">
                                    <div class="paperclip">
                                        <i data-feather="paperclip"></i>
                                    </div>
                                </div>
                                <div class="attachments-inner">
                                    <div class="box has-file video">
                                        <div class="box-inner">
                                            <i data-feather="play-circle"></i>
                                            <h5>terrans.mp4</h5>
                                        </div>
                                        <div class="actions-group">
                                            <a class="action">
                                                <i data-feather="download"></i>
                                            </a>
                                            <a class="action">
                                                <i data-feather="play"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="box has-file video">
                                        <div class="box-inner">
                                            <i data-feather="play-circle"></i>
                                            <h5>zergs.mp4</h5>
                                        </div>
                                        <div class="actions-group">
                                            <a class="action">
                                                <i data-feather="download"></i>
                                            </a>
                                            <a class="action">
                                                <i data-feather="play"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="box has-file video">
                                        <div class="box-inner">
                                            <i data-feather="play-circle"></i>
                                            <h5>protoss.mp4</h5>
                                        </div>
                                        <div class="actions-group">
                                            <a class="action">
                                                <i data-feather="download"></i>
                                            </a>
                                            <a class="action">
                                                <i data-feather="play"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="reply-wrapper">
                                <div class="reply-title">
                                    Reply to conversation
                                    <i data-feather="help-circle" class="has-tip"></i>
                                    <!-- Title Popover -->
                                    <div class="webui-popover-content">
                                        <div class="popover-flex-block">
                                            <div class="icon-block">
                                                <i data-feather="info"></i>
                                            </div>
                                            <div class="content-block">
                                                <span>Format message, </span>
                                                <span>Select the text you want to edit to make the toolbar appear.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="reply-wrapper-inner">
                                    <div class="flex-form">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="">
                                        <div class="control">
                                            <div class="reply-textarea"></div>
                                        </div>
                                    </div>
                                    <div class="has-text-right">
                                        <button type="button" class="button is-solid accent-button is-bold raised send-message">Send
                                            Message</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>