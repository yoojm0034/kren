<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<style>
.cover-bg .cover-image {
max-height: 200px;
}

#map {
	height: 200px;
	width: 100%;
}

.menu-badge {
	margin-left: auto;
    height: 25px;
    font-size: 1rem;
    font-weight: 500;
    padding: 7px;
    line-height: 1.3;
    min-width: 22px;
    text-align: center;
    border-radius: 100px;
    background: #e5e5e5;
    color: #393a4f;
}

a[href^="http://maps.google.com/maps"] {
	display: none !important
}

a[href^="https://maps.google.com/maps"] {
	display: none !important
}

.gmnoprint a, .gmnoprint span, .gm-style-cc {
	display: none;
}

.gmnoprint div {
	background: none !important;
}

.cover-bg .avatar .avatar-flag {
    position: absolute;
    bottom: 0;
    left: inherit;
    height: 40px;
    width: 40px;
    border-radius: 50%;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    box-shadow: 0 14px 26px -12px rgb(61 112 178 / 42%), 0 4px 23px 0px rgb(0 0 0 / 12%), 0 8px 10px -5px rgb(61 112 178 / 20%) !important;
    transform: rotate(0);
    transition: all .3s;
    cursor: pointer;
    z-index: 1;

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	initMap();
	function initMap() {
    const city = { lat: 35.73163,
    		lng: 128.62216};
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 9,
      center: city,
      mapTypeControl: false,
      streetViewControl: false,
    });
    const marker = new google.maps.Marker({
      position: city,
      map: map,
    });
	};
});
</script>
<body>
        <!-- Container -->
        <div class="container is-custom">

            <!-- Profile page main wrapper -->
            <div id="profile-main" class="view-wrap is-headless">
                <div class="columns is-multiline no-margin">
                    <!-- Left side column -->
                    <div class="column is-paddingless">
                        <!-- Timeline Header -->
                        <!-- html/partials/pages/profile/timeline/timeline-header.html -->
                        <div class="cover-bg">
                            <div id="map"></div>
                            <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD523dZdQiMvJDOsNySdn1RdQlA_7g5DM&callback=initMap"></script>
                            <div class="avatar">
                                <img id="user-avatar" class="avatar-image" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" alt="">
                                <div class="avatar-flag">
                                	<img src="${user.flag}">
                                </div>
                                <div class="pop-button is-far-left has-tooltip modal-trigger" data-modal="change-profile-pic-modal" data-placement="right" data-title="Change profile picture">
                                    <a class="inner">
                                        <i data-feather="camera"></i>
                                    </a>
                                </div>
                                <div id="follow-pop" class="pop-button pop-shift is-left has-tooltip" data-placement="top" data-title="Subscription">
                                    <a class="inner">
                                        <i class="inactive-icon" data-feather="bell"></i>
                                        <i class="active-icon" data-feather="bell-off"></i>
                                    </a>
                                </div>
                                <div id="invite-pop" class="pop-button pop-shift is-center has-tooltip" data-placement="top" data-title="Relationship">
                                    <a href="#" class="inner">
                                        <i class="inactive-icon" data-feather="plus"></i>
                                        <i class="active-icon" data-feather="minus"></i>
                                    </a>
                                </div>
                                <div id="chat-pop" class="pop-button is-right has-tooltip" data-placement="top" data-title="Chat">
                                    <a class="inner">
                                        <i data-feather="message-circle"></i>
                                    </a>
                                </div>
                                <div class="pop-button is-far-right has-tooltip" data-placement="right" data-title="Send message">
                                    <a href="messages-inbox.html" class="inner">
                                        <i data-feather="mail"></i>
                                    </a>
                                </div>
                            </div>
                            <!--/html/partials/pages/profile/timeline/dropdowns/timeline-mobile-dropdown.html-->
                            <div class="dropdown is-spaced is-right is-accent dropdown-trigger timeline-mobile-dropdown is-hidden-desktop">
                                <div>
                                    <div class="button">
                                        <i data-feather="more-vertical"></i>
                                    </div>
                                </div>
                                <div class="dropdown-menu" role="menu">
                                    <div class="dropdown-content">
                                        <a href="/profile-main.html" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="activity"></i>
                                                <div class="media-content">
                                                    <h3>Timeline</h3>
                                                    <small>Open Timeline.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="/profile-about.html" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="align-right"></i>
                                                <div class="media-content">
                                                    <h3>About</h3>
                                                    <small>See about info.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="/profile-friends.html" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="heart"></i>
                                                <div class="media-content">
                                                    <h3>Friends</h3>
                                                    <small>See friends.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="/profile-photos.html" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="image"></i>
                                                <div class="media-content">
                                                    <h3>Photos</h3>
                                                    <small>See all photos.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="box-heading" style="display: block; margin-bottom: 15px;">
                        <div class="profile-menu is-hidden-mobile">
                            <div class="menu-start">
                                <a href="profile-main.html"><img src="resources/template/assets/img/logo/stamp.png" style="width:35px; vertical-align: middle">
                                Stamp <span class="menu-badge">10</span></a>
                            </div>
                            <div class="menu-end">
                                <a id="profile-friends-link" href="profile-friends.html" class="button has-min-width">Friends</a>
                                <a href="profile-photos.html" class="button has-min-width">Photos</a>
                            </div>
                        </div>

                        <div class="profile-subheader">
                            <div class="subheader-start is-hidden-mobile">
                                <span>3.4K</span>
                                <span>Friends</span>
                                <span>3.4K</span>
                                <span>Friends</span>
                                <span>3.4K</span>
                                <span>Friends</span>
                            </div>
                            <div class="subheader-middle">
                                <h2>${user.name}</h2>
                            </div>
                            <div class="subheader-end is-hidden-mobile">
                                <a class="button has-icon is-bold">
                                    <i data-feather="clock"></i>
                                    History
                                </a>
                            </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="columns">
                    <div id="profile-timeline-widgets" class="column is-4">

                        <!-- Basic Infos widget -->
                        <!-- html/partials/pages/profile/timeline/widgets/basic-infos-widget.html -->
                        <div class="box-heading">
                            <h4>Basic Infos</h4>
                            <div class="dropdown is-neutral is-spaced is-right dropdown-trigger">
                                <div>
                                    <div class="button">
                                        <i data-feather="more-vertical"></i>
                                    </div>
                                </div>
                                <div class="dropdown-menu" role="menu">
                                    <div class="dropdown-content">
                                        <a href="profile-about.html" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="eye"></i>
                                                <div class="media-content">
                                                    <h3>View</h3>
                                                    <small>View user details.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="search"></i>
                                                <div class="media-content">
                                                    <h3>Related</h3>
                                                    <small>Search for related users.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="basic-infos-wrapper">
                            <div class="card is-profile-info">
                                <div class="info-row">
                                    <div>
                                        <span>Studied at</span>
                                        <a class="is-inverted">Georgetown University</a>
                                    </div>
                                    <i class="mdi mdi-school"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>Married to</span>
                                        <a class="is-inverted">Dan Walker</a>
                                    </div>
                                    <i class="mdi mdi-heart"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>From</span>
                                        <a class="is-inverted">Melbourne, AU</a>
                                    </div>
                                    <i class="mdi mdi-earth"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>Lives in</span>
                                        <a class="is-inverted">Los Angeles, CA</a>
                                    </div>
                                    <i class="mdi mdi-map-marker"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>Followers</span>
                                        <a class="is-muted">258 followers</a>
                                    </div>
                                    <i class="mdi mdi-bell-ring"></i>
                                </div>
                            </div>
                        </div>
                        <!-- Photos widget -->
                        <!-- html/partials/pages/profile/timeline/widgets/photos-widget.html -->
                        <div class="box-heading">
                            <h4>Photos</h4>
                            <div class="dropdown is-neutral is-spaced is-right dropdown-trigger">
                                <div>
                                    <div class="button">
                                        <i data-feather="more-vertical"></i>
                                    </div>
                                </div>
                                <div class="dropdown-menu" role="menu">
                                    <div class="dropdown-content">
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="image"></i>
                                                <div class="media-content">
                                                    <h3>View Photos</h3>
                                                    <small>View all your photos</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="tag"></i>
                                                <div class="media-content">
                                                    <h3>Tagged</h3>
                                                    <small>View photos you are tagged in.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="folder"></i>
                                                <div class="media-content">
                                                    <h3>Albums</h3>
                                                    <small>Open my albums.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="is-photos-widget">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/1.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/2.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/3.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/4.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/5.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/6.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/7.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/8.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/9.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/10.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/11.jpg" alt="">
                            <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/photos/12.jpg" alt="">
                        </div>
                        <!-- Star friends widget -->
                        <!-- html/partials/pages/profile/timeline/widgets/star-friends-widget.html -->
                        <div class="box-heading">
                            <h4>Friends</h4>
                            <div class="dropdown is-neutral is-spaced is-right dropdown-trigger">
                                <div>
                                    <div class="button">
                                        <i data-feather="more-vertical"></i>
                                    </div>
                                </div>
                                <div class="dropdown-menu" role="menu">
                                    <div class="dropdown-content">
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="users"></i>
                                                <div class="media-content">
                                                    <h3>All Friends</h3>
                                                    <small>View all friends.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="heart"></i>
                                                <div class="media-content">
                                                    <h3>Family</h3>
                                                    <small>View family members.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="briefcase"></i>
                                                <div class="media-content">
                                                    <h3>Work Relations</h3>
                                                    <small>View work related friends.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="friend-cards-list">
                            <div class="card is-friend-card">

                                <div class="friend-item">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="" data-user-popover="1">
                                    <div class="text-content">
                                        <a>Dan Walker</a>
                                        <span>4 mutual friend(s)</span>
                                    </div>
                                    <div class="star-friend">
                                        <i data-feather="star"></i>
                                    </div>
                                </div>

                                <div class="friend-item">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="" data-user-popover="7">
                                    <div class="text-content">
                                        <a>Milly Augustine</a>
                                        <span>3 mutual friend(s)</span>
                                    </div>
                                    <div class="star-friend is-active">
                                        <i data-feather="star"></i>
                                    </div>
                                </div>

                                <div class="friend-item">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" alt="" data-user-popover="5">
                                    <div class="text-content">
                                        <a>Edward Mayers</a>
                                        <span>35 mutual friend(s)</span>
                                    </div>
                                    <div class="star-friend is-active">
                                        <i data-feather="star"></i>
                                    </div>
                                </div>

                                <div class="friend-item">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" alt="" data-user-popover="2">
                                    <div class="text-content">
                                        <a>Stella Bergmann</a>
                                        <span>48 mutual friend(s)</span>
                                    </div>
                                    <div class="star-friend">
                                        <i data-feather="star"></i>
                                    </div>
                                </div>

                                <div class="friend-item">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="" data-user-popover="6">
                                    <div class="text-content">
                                        <a>Elise Walker</a>
                                        <span>1 mutual friend(s)</span>
                                    </div>
                                    <div class="star-friend">
                                        <i data-feather="star"></i>
                                    </div>
                                </div>

                                <div class="friend-item">
                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" alt="" data-user-popover="9">
                                    <div class="text-content">
                                        <a>Nelly Schwartz</a>
                                        <span>11 mutual friend(s)</span>
                                    </div>
                                    <div class="star-friend">
                                        <i data-feather="star"></i>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- Trips widget -->
                        <!-- html/partials/pages/profile/timeline/widgets/trips-widget.html -->
                        <div class="box-heading">
                            <h4>Trips</h4>
                            <div class="dropdown is-neutral is-spaced is-right dropdown-trigger">
                                <div>
                                    <div class="button">
                                        <i data-feather="more-vertical"></i>
                                    </div>
                                </div>
                                <div class="dropdown-menu" role="menu">
                                    <div class="dropdown-content">
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="globe"></i>
                                                <div class="media-content">
                                                    <h3>View my Trips</h3>
                                                    <small>View all your trips</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="compass"></i>
                                                <div class="media-content">
                                                    <h3>Suggestions</h3>
                                                    <small>View trendy suggestions.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="trip-cards-list">
                            <div class="card is-trip-card">

                                <div class="trip-item">
                                    <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/trips/1.jpg" alt="">
                                    <div class="text-content">
                                        <a>New York, NY, USA</a>
                                        <span>4 months ago</span>
                                    </div>
                                </div>
                                <div class="trip-item">
                                    <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/trips/2.jpg" alt="">
                                    <div class="text-content">
                                        <a>Paris, France</a>
                                        <span>8 months ago</span>
                                    </div>
                                </div>
                                <div class="trip-item">
                                    <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/trips/3.jpg" alt="">
                                    <div class="text-content">
                                        <a>Madrid, Spain</a>
                                        <span>a year ago</span>
                                    </div>
                                </div>
                                <div class="trip-item">
                                    <img src="https://via.placeholder.com/200x200" data-demo-src="assets/img/demo/widgets/trips/4.jpg" alt="">
                                    <div class="text-content">
                                        <a>Marrakech, Morocco</a>
                                        <span>a year ago</span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="column is-8">
                        <div id="profile-timeline-posts" class="box-heading">
                            <h4>Posts</h4>
                            <div class="button-wrap">
                                <button type="button" class="button is-active">Recent</button>
                                <button type="button" class="button">Popular</button>
                            </div>
                        </div>

                        <div class="profile-timeline">

                            <!-- Timeline post 1 -->
                            <!-- html/partials/pages/profile/posts/timeline-post1.html -->
                            <!-- Timeline POST #1 -->
                            <div class="profile-post">
                                <!-- Post -->
                                <div class="card is-post">
                                    <!-- Main wrap -->
                                    <div class="content-wrap">
                                        <!-- Header -->
                                        <div class="card-heading">
                                            <div class="user-block">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                </div>
                                                <div class="user-info">
                                                    <a href="#">Jenna Davis</a>
                                                    <span class="time">October 17 2018, 11:03am</span>
                                                </div>
                                            </div>

                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                <div>
                                                    <div class="button">
                                                        <i data-feather="more-vertical"></i>
                                                    </div>
                                                </div>
                                                <div class="dropdown-menu" role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bookmark"></i>
                                                                <div class="media-content">
                                                                    <h3>Bookmark</h3>
                                                                    <small>Add this post to your bookmarks.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bell"></i>
                                                                <div class="media-content">
                                                                    <h3>Notify me</h3>
                                                                    <small>Send me the updates.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <hr class="dropdown-divider">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="flag"></i>
                                                                <div class="media-content">
                                                                    <h3>Flag</h3>
                                                                    <small>In case of inappropriate content.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Header -->

                                        <!-- Post body -->
                                        <div class="card-body">
                                            <!-- Post body text -->
                                            <div class="post-text">
                                                <p>Today i visited this amazing little fashion store in Church street. Everything is handmade, from skirts
                                                    to bags. Their products really have an outstanding quality. If you don't know them already, well
                                                    it's time to make your move!
                                                    <p>
                                            </div>
                                            <!-- Featured image -->
                                            <div class="post-image">
                                                <a data-fancybox="profile-post1" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/8.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/8.jpg">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/8.jpg" alt="">
                                                </a>
                                                <!-- Post actions -->
                                                <div class="like-wrapper">
                                                    <a href="javascript:void(0);" class="like-button">
                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
                                                        <span class="like-overlay"></span>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-share">
                                                    <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                        <i data-feather="link-2"></i>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-comment">
                                                    <a href="javascript:void(0);" class="small-fab">
                                                        <i data-feather="message-circle"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post body -->

                                        <!-- Post footer -->
                                        <div class="card-footer">
                                            <!-- Followers -->
                                            <div class="likers-group">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" data-user-popover="7" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="">
                                            </div>
                                            <div class="likers-text">
                                                <p>
                                                    <a href="#">Milly</a>,
                                                    <a href="#">David</a>
                                                </p>
                                                <p>and 1 more liked this</p>
                                            </div>
                                            <!-- Post statistics -->
                                            <div class="social-count">
                                                <div class="likes-count">
                                                    <i data-feather="heart"></i>
                                                    <span>32</span>
                                                </div>
                                                <div class="shares-count">
                                                    <i data-feather="link-2"></i>
                                                    <span>4</span>
                                                </div>
                                                <div class="comments-count">
                                                    <i data-feather="message-circle"></i>
                                                    <span>5</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post footer -->
                                    </div>
                                    <!-- /Main wrap -->

                                    <!-- Comments -->
                                    <div class="comments-wrap is-hidden">
                                        <!-- Header -->
                                        <div class="comments-heading">
                                            <h4>Comments
                                                <small>(5)</small></h4>
                                            <div class="close-comments">
                                                <i data-feather="x"></i>
                                            </div>
                                        </div>
                                        <!-- Header -->

                                        <!-- Comments body -->
                                        <div class="comments-body has-slimscroll">

                                            <!-- Comment -->
                                            <div class="media is-comment">
                                                <!-- User image -->
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/bobby.jpg" data-user-popover="8" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Bobby Brown</a>
                                                    <span class="time">1 hour ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris consequat.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>1</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Daniel Wellington</a>
                                                            <span class="time">3 minutes ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>4</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/mike.jpg" data-user-popover="12" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Mike Lasalle</a>
                                                    <span class="time">Yesterday</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>3</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/lana.jpeg" data-user-popover="10" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Lana Henrikssen</a>
                                                            <span class="time">3 minutes ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>4</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Nelly Schwartz</a>
                                                    <span class="time">2 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>1</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                        <!-- Comments body -->

                                        <!-- Comments footer -->
                                        <div class="card-footer">
                                            <div class="media post-comment has-emojis">
                                                <!-- Textarea -->
                                                <div class="media-content">
                                                    <div class="field">
                                                        <p class="control">
                                                            <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                        </p>
                                                    </div>
                                                    <!-- Additional actions -->
                                                    <div class="actions">
                                                        <div class="image is-32x32">
                                                            <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
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
                                                                <input type="file">
                                                            </div>
                                                            <a class="button is-solid primary-button raised">Post Comment</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comments footer -->
                                    </div>
                                    <!-- /Comments -->
                                </div>
                                <!-- /Post -->
                            </div>
                            <!-- /Timeline POST #3 -->
                            <!-- Timeline post 2 -->
                            <!-- html/partials/pages/profile/posts/timeline-post2.html -->
                            <!-- Timeline POST #2 -->
                            <div class="profile-post">
                                <!-- Post -->
                                <div class="card is-post has-nested">
                                    <!-- Main wrap -->
                                    <div class="content-wrap">
                                        <!-- Header -->
                                        <div class="card-heading">
                                            <div class="user-block">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="">
                                                </div>
                                                <div class="user-info">
                                                    <a href="#">Elise Walker shared
                                                        <span>Dan Walker's post</span> on your feed</a>
                                                    <span class="time">July 19 2018, 19:42pm</span>
                                                </div>
                                            </div>

                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                <div>
                                                    <div class="button">
                                                        <i data-feather="more-vertical"></i>
                                                    </div>
                                                </div>
                                                <div class="dropdown-menu" role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bookmark"></i>
                                                                <div class="media-content">
                                                                    <h3>Bookmark</h3>
                                                                    <small>Add this post to your bookmarks.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bell"></i>
                                                                <div class="media-content">
                                                                    <h3>Notify me</h3>
                                                                    <small>Send me the updates.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <hr class="dropdown-divider">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="flag"></i>
                                                                <div class="media-content">
                                                                    <h3>Flag</h3>
                                                                    <small>In case of inappropriate content.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Header -->

                                        <!-- Post body -->
                                        <div class="card-body">
                                            <!-- Post body text -->
                                            <div class="post-text">
                                                <p>My brother went to their concert last night, and looks like he had tons of fun. We should really do things
                                                    like this together.
                                                    <p>
                                            </div>
                                            <!-- Featured image -->

                                            <!-- Nested Post (Shared) -->
                                            <div class="card is-post is-nested">
                                                <!-- Main wrap -->
                                                <div class="content-wrap">
                                                    <!-- Post header -->
                                                    <div class="card-heading">
                                                        <!-- User meta -->
                                                        <div class="user-block">
                                                            <div class="image">
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="">
                                                            </div>
                                                            <div class="user-info">
                                                                <a href="#">Dan Walker</a>
                                                                <span class="time">July 26 2018, 01:03pm</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /Post header -->

                                                    <!-- Post body -->
                                                    <div class="card-body">
                                                        <!-- Post body text -->
                                                        <div class="post-text">
                                                            <p>Yesterday with
                                                                <a href="#">@Karen Miller</a> and
                                                                <a href="#">@Marvin Stemperd</a> at the
                                                                <a href="#">#Rock'n'Rolla</a> concert in LA. Was totally fantastic! People were really excited about
                                                                this one!</p>
                                                        </div>
                                                        <!-- Featured image -->
                                                        <div class="post-image">
                                                            <a data-fancybox="profile-post2" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/1.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/1.jpg">
                                                                <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/1.jpg" alt="">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <!-- /Post body -->
                                                </div>
                                                <!-- /Main wrap -->
                                            </div>
                                            <!-- /Nested Post (Shared) -->
                                            <div class="action-wrap">
                                                <!-- Post actions -->
                                                <div class="like-wrapper">
                                                    <a href="javascript:void(0);" class="like-button">
                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
                                                        <span class="like-overlay"></span>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-share">
                                                    <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                        <i data-feather="link-2"></i>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-comment">
                                                    <a href="javascript:void(0);" class="small-fab">
                                                        <i data-feather="message-circle"></i>
                                                    </a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- /Post body -->

                                        <!-- Post footer -->
                                        <div class="card-footer">
                                            <!-- Followers -->
                                            <div class="likers-group">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="2" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/rolf.jpg" data-user-popover="13" alt="">
                                            </div>
                                            <div class="likers-text">
                                                <p>
                                                    <a href="#">Jenna</a>,
                                                    <a href="#">Edward</a>
                                                </p>
                                                <p>and 3 more liked this</p>
                                            </div>
                                            <!-- Post statistics -->
                                            <div class="social-count">
                                                <div class="likes-count">
                                                    <i data-feather="heart"></i>
                                                    <span>5</span>
                                                </div>
                                                <div class="shares-count">
                                                    <i data-feather="link-2"></i>
                                                    <span>0</span>
                                                </div>
                                                <div class="comments-count">
                                                    <i data-feather="message-circle"></i>
                                                    <span>4</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post footer -->
                                    </div>
                                    <!-- /Main wrap -->

                                    <!-- Comments -->
                                    <div class="comments-wrap is-hidden">
                                        <!-- Header -->
                                        <div class="comments-heading">
                                            <h4>Comments
                                                <small>(4)</small></h4>
                                            <div class="close-comments">
                                                <i data-feather="x"></i>
                                            </div>
                                        </div>
                                        <!-- Header -->

                                        <!-- Comments body -->
                                        <div class="comments-body has-slimscroll">

                                            <!-- Comment -->
                                            <div class="media is-comment">
                                                <!-- User image -->
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">David Kim</a>
                                                    <span class="time">5 hours ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris consequat.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>1</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Daniel Wellington</a>
                                                            <span class="time">3 minutes ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>4</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Edward Mayers</a>
                                                    <span class="time">Yesterday</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>3</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Nelly Schwartz</a>
                                                    <span class="time">2 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>1</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                        <!-- Comments body -->

                                        <!-- Comments footer -->
                                        <div class="card-footer">
                                            <div class="media post-comment has-emojis">
                                                <!-- Textarea -->
                                                <div class="media-content">
                                                    <div class="field">
                                                        <p class="control">
                                                            <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                        </p>
                                                    </div>
                                                    <!-- Additional actions -->
                                                    <div class="actions">
                                                        <div class="image is-32x32">
                                                            <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
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
                                                                <input type="file">
                                                            </div>
                                                            <a class="button is-solid primary-button raised">Post Comment</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comments footer -->
                                    </div>
                                    <!-- /Comments -->
                                </div>
                                <!-- /Post -->
                            </div>
                            <!-- /Timeline POST #2 -->
                            <!-- Timeline post 3 -->
                            <!-- html/partials/pages/profile/posts/timeline-post3.html -->
                            <!-- Timeline POST #3 -->
                            <div class="profile-post">
                                <!-- Post -->
                                <div class="card is-post">
                                    <!-- Main wrap -->
                                    <div class="content-wrap">
                                        <!-- Header -->
                                        <div class="card-heading">
                                            <div class="user-block">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                </div>
                                                <div class="user-info">
                                                    <a href="#">Jenna Davis</a>
                                                    <span class="time">October 09 2018, 11:03am</span>
                                                </div>
                                            </div>

                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                <div>
                                                    <div class="button">
                                                        <i data-feather="more-vertical"></i>
                                                    </div>
                                                </div>
                                                <div class="dropdown-menu" role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bookmark"></i>
                                                                <div class="media-content">
                                                                    <h3>Bookmark</h3>
                                                                    <small>Add this post to your bookmarks.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bell"></i>
                                                                <div class="media-content">
                                                                    <h3>Notify me</h3>
                                                                    <small>Send me the updates.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <hr class="dropdown-divider">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="flag"></i>
                                                                <div class="media-content">
                                                                    <h3>Flag</h3>
                                                                    <small>In case of inappropriate content.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Header -->

                                        <!-- Post body -->
                                        <div class="card-body">
                                            <!-- Post body text -->
                                            <div class="post-text">
                                                <p>Today i visited this amazing little fashion store in Church street. Everything is handmade, from skirts
                                                    to bags. Their products really have an outstanding quality. If you don't know them already, well
                                                    it's time to make your move!
                                                    <p>
                                            </div>
                                            <!-- Featured image -->
                                            <div class="post-image">
                                                <a data-fancybox="profile-post3" data-lightbox-type="comments" data-thumb="/assets/img/demo/video/dress.jpg" href="#myVideo">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="/assets/img/demo/video/dress.jpg" alt="">
                                                </a>
                                                <!-- Post actions -->
                                                <div class="like-wrapper">
                                                    <a href="javascript:void(0);" class="like-button">
                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
                                                        <span class="like-overlay"></span>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-share">
                                                    <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                        <i data-feather="link-2"></i>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-comment">
                                                    <a href="javascript:void(0);" class="small-fab">
                                                        <i data-feather="message-circle"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post body -->

                                        <!-- Post footer -->
                                        <div class="card-footer">
                                            <!-- Followers -->
                                            <div class="likers-group">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="2" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" data-user-popover="7" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="">
                                            </div>
                                            <div class="likers-text">
                                                <p>
                                                    <a href="#">Milly</a>,
                                                    <a href="#">David</a>
                                                </p>
                                                <p>and 56 more liked this</p>
                                            </div>
                                            <!-- Post statistics -->
                                            <div class="social-count">
                                                <div class="likes-count">
                                                    <i data-feather="heart"></i>
                                                    <span>58</span>
                                                </div>
                                                <div class="shares-count">
                                                    <i data-feather="link-2"></i>
                                                    <span>12</span>
                                                </div>
                                                <div class="comments-count">
                                                    <i data-feather="message-circle"></i>
                                                    <span>9</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post footer -->
                                    </div>
                                    <!-- /Main wrap -->

                                    <!-- Comments -->
                                    <div class="comments-wrap is-hidden">
                                        <!-- Header -->
                                        <div class="comments-heading">
                                            <h4>Comments
                                                <small>(9)</small></h4>
                                            <div class="close-comments">
                                                <i data-feather="x"></i>
                                            </div>
                                        </div>
                                        <!-- Header -->

                                        <!-- Comments body -->
                                        <div class="comments-body has-slimscroll">

                                            <!-- Comment -->
                                            <div class="media is-comment">
                                                <!-- User image -->
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" data-user-popover="7" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Milly Augustine</a>
                                                    <span class="time">1 hour ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris consequat.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>1</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Edward Mayers</a>
                                                            <span class="time">30 minutes ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>3</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Elise Walker</a>
                                                            <span class="time">15 minutes ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>0</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="2" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Stella Bergmann</a>
                                                    <span class="time">1 hour ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>5</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Jenna Davis</a>
                                                            <span class="time">30 minutes ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>0</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Edward Mayers</a>
                                                    <span class="time">Yesterday</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>3</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Nelly Schwartz</a>
                                                    <span class="time">2 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>1</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Jenna Davis</a>
                                                            <span class="time">2 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>3</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Elise Walker</a>
                                                            <span class="time">2 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>0</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                        <!-- Comments body -->

                                        <!-- Comments footer -->
                                        <div class="card-footer">
                                            <div class="media post-comment has-emojis">
                                                <!-- Textarea -->
                                                <div class="media-content">
                                                    <div class="field">
                                                        <p class="control">
                                                            <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                        </p>
                                                    </div>
                                                    <!-- Additional actions -->
                                                    <div class="actions">
                                                        <div class="image is-32x32">
                                                            <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
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
                                                                <input type="file">
                                                            </div>
                                                            <a class="button is-solid primary-button raised">Post Comment</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comments footer -->
                                    </div>
                                    <!-- /Comments -->
                                </div>
                                <!-- /Post -->
                            </div>
                            <!-- Timeline POST #3 -->

                            <video width="800" height="450" controls id="myVideo" style="display:none;">
                                <source src="assets/img/demo/video/source/dress.mp4" type="video/mp4">
                                <source src="assets/img/demo/video/source/dress.webm" type="video/webm">
                                <source src="assets/img/demo/video/source/dress.ogg" type="video/ogg">
                                Your browser doesn't support HTML5 video tag.
                            </video>
                            <!-- Timeline post 4 -->
                            <!-- html/partials/pages/profile/posts/timeline-post4.html -->
                            <!-- Timeline POST #4 -->
                            <div class="profile-post">
                                <!-- Post -->
                                <div class="card is-post">
                                    <!-- Main wrap -->
                                    <div class="content-wrap">
                                        <!-- Header -->
                                        <div class="card-heading">
                                            <div class="user-block">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                </div>
                                                <div class="user-info">
                                                    <a href="#">Jenna Davis</a>
                                                    <span class="time">September 26 2018, 11:18am</span>
                                                </div>
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                <div>
                                                    <div class="button">
                                                        <i data-feather="more-vertical"></i>
                                                    </div>
                                                </div>
                                                <div class="dropdown-menu" role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bookmark"></i>
                                                                <div class="media-content">
                                                                    <h3>Bookmark</h3>
                                                                    <small>Add this post to your bookmarks.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bell"></i>
                                                                <div class="media-content">
                                                                    <h3>Notify me</h3>
                                                                    <small>Send me the updates.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <hr class="dropdown-divider">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="flag"></i>
                                                                <div class="media-content">
                                                                    <h3>Flag</h3>
                                                                    <small>In case of inappropriate content.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Header -->

                                        <!-- Post body -->
                                        <div class="card-body">
                                            <!-- Post body text -->
                                            <div class="post-text">
                                                <p>Hello everyone! Today iam posting a review of the latest shoe trends. I tried for you more than 30 pairs of shoes. I had some crushes and some deceptions, However, it was a great experience i would like to share with you.<p>
                                            </div>
                                            <!-- Featured image -->
                                            <div class="post-image">
                                                <!-- CSS masonry wrap -->
                                                <div class="masonry-grid">
                                                    <!-- Left column -->
                                                    <div class="masonry-column-left">
                                                        <a data-fancybox="profile-post4" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/9.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/9.jpg">
                                                            <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/9.jpg" alt="">
                                                        </a>
                                                        <a data-fancybox="profile-post4" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/10.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/10.jpg">
                                                            <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/10.jpg" alt="">
                                                        </a>
                                                    </div>
                                                    <!-- Right column -->
                                                    <div class="masonry-column-right">
                                                        <a data-fancybox="profile-post4" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/11.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/11.jpg">
                                                            <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/11.jpg" alt="">
                                                        </a>
                                                        <a data-fancybox="profile-post4" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/12.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/12.jpg">
                                                            <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/12.jpg" alt="">
                                                        </a>
                                                        <a data-fancybox="profile-post4" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/13.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/13.jpg">
                                                            <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/13.jpg" alt="">
                                                        </a>
                                                    </div>
                                                    <!-- Post actions -->
                                                    <div class="like-wrapper">
                                                        <a href="javascript:void(0);" class="like-button">
                                                            <i class="mdi mdi-heart not-liked bouncy"></i>
                                                            <i class="mdi mdi-heart is-liked bouncy"></i>
                                                            <span class="like-overlay"></span>
                                                        </a>
                                                    </div>

                                                    <div class="fab-wrapper is-share">
                                                        <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                            <i data-feather="link-2"></i>
                                                        </a>
                                                    </div>

                                                    <div class="fab-wrapper is-comment">
                                                        <a href="javascript:void(0);" class="small-fab">
                                                            <i data-feather="message-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post body -->

                                        <!-- Post footer -->
                                        <div class="card-footer">
                                            <!-- Followers -->
                                            <div class="likers-group">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/rolf.jpg" data-user-popover="13" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/mike.jpg" data-user-popover="12" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="">
                                            </div>
                                            <div class="likers-text">
                                                <p>
                                                    <a href="#">Mike</a>,
                                                    <a href="#">Rolf</a>
                                                </p>
                                                <p>and 31 more liked this</p>
                                            </div>
                                            <!-- Post statistics -->
                                            <div class="social-count">
                                                <div class="likes-count">
                                                    <i data-feather="heart"></i>
                                                    <span>33</span>
                                                </div>
                                                <div class="shares-count">
                                                    <i data-feather="link-2"></i>
                                                    <span>3</span>
                                                </div>
                                                <div class="comments-count">
                                                    <i data-feather="message-circle"></i>
                                                    <span>8</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post footer -->
                                    </div>
                                    <!-- Main wrap -->

                                    <!-- Comments -->
                                    <div class="comments-wrap is-hidden">
                                        <!-- Header -->
                                        <div class="comments-heading">
                                            <h4>Comments
                                                <small>(8)</small></h4>
                                            <div class="close-comments">
                                                <i data-feather="x"></i>
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="2" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Stella Bergmann</a>
                                                    <span class="time">17 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris consequat.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>0</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Jenna Davis</a>
                                                            <span class="time">17 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>4</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">David Kim</a>
                                                            <span class="time">17 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>1</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" data-user-popover="7" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Milly Augustine</a>
                                                            <span class="time">17 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>1</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Daniel Wellington</a>
                                                    <span class="time">17 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>6</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">David Kim</a>
                                                    <span class="time">18 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>5</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="2" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Stella Bergmann</a>
                                                            <span class="time">18 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>7</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/mike.jpg" data-user-popover="12" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Mike Lasalle</a>
                                                    <span class="time">20 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt.</p>
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>5</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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

                                            <!-- Load More comments -->
                                            <div class="load-more has-text-centered">
                                                <button class="load-more-button">
                                                    <i data-feather="more-horizontal"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <!-- /Comments body -->

                                        <!-- Comments footer -->
                                        <div class="card-footer">
                                            <div class="media post-comment has-emojis">
                                                <!-- Textarea -->
                                                <div class="media-content">
                                                    <div class="field">
                                                        <p class="control">
                                                            <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                        </p>
                                                    </div>
                                                    <!-- Additional actions -->
                                                    <div class="actions">
                                                        <div class="image is-32x32">
                                                            <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
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
                                                                <input type="file">
                                                            </div>
                                                            <a class="button is-solid primary-button raised">Post Comment</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comments footer -->
                                    </div>
                                    <!-- /Comments -->
                                </div>
                                <!-- /Post -->
                            </div>
                            <!-- /timeline POST #4 -->
                            <!-- Timeline post 5 -->
                            <!-- html/partials/pages/profile/posts/timeline-post5.html -->
                            <!-- Timeline POST #5 -->
                            <div class="profile-post is-simple">
                                <!-- Post -->
                                <div class="card is-post">
                                    <!-- Main wrap -->
                                    <div class="content-wrap">
                                        <!-- Header -->
                                        <div class="card-heading">
                                            <!-- User image -->
                                            <div class="user-block">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                </div>
                                                <div class="user-info">
                                                    <a href="#">Jenna Davis</a>
                                                    <span class="time">September 17 2018, 10:23am</span>
                                                </div>
                                            </div>

                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                <div>
                                                    <div class="button">
                                                        <i data-feather="more-vertical"></i>
                                                    </div>
                                                </div>
                                                <div class="dropdown-menu" role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bookmark"></i>
                                                                <div class="media-content">
                                                                    <h3>Bookmark</h3>
                                                                    <small>Add this post to your bookmarks.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bell"></i>
                                                                <div class="media-content">
                                                                    <h3>Notify me</h3>
                                                                    <small>Send me the updates.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <hr class="dropdown-divider">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="flag"></i>
                                                                <div class="media-content">
                                                                    <h3>Flag</h3>
                                                                    <small>In case of inappropriate content.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Header -->

                                        <!-- Post body -->
                                        <div class="card-body">
                                            <!-- Post body text -->
                                            <div class="post-text">
                                                <p>Hello guys, I need a ride because I need to go to <a href="#">#Los Angeles</a> to see a customer. I didn't have time to buy a train ticket so can anyone pick me up in the morning if he is going there too ?<p>
                                            </div>
                                            <!-- Post actions -->
                                            <div class="post-actions">
                                                <div class="like-wrapper">
                                                    <a href="javascript:void(0);" class="like-button">
                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
                                                        <span class="like-overlay"></span>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-share">
                                                    <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                        <i data-feather="link-2"></i>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-comment">
                                                    <a href="javascript:void(0);" class="small-fab">
                                                        <i data-feather="message-circle"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post body -->

                                        <!-- Post footer -->
                                        <div class="card-footer">
                                            <!-- Followers -->
                                            <div class="likers-group">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="">
                                            </div>
                                            <div class="likers-text">
                                                <p><a href="#">Daniel</a> and <a href="#">Elise</a></p>
                                                <p>liked this</p>
                                            </div>
                                            <!-- Post statistics -->
                                            <div class="social-count">
                                                <div class="likes-count">
                                                    <i data-feather="heart"></i>
                                                    <span>2</span>
                                                </div>
                                                <div class="shares-count">
                                                    <i data-feather="link-2"></i>
                                                    <span>0</span>
                                                </div>
                                                <div class="comments-count">
                                                    <i data-feather="message-circle"></i>
                                                    <span>2</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post footer -->
                                    </div>
                                    <!-- /Main wrap -->

                                    <!-- Post #6 comments -->
                                    <div class="comments-wrap is-hidden">
                                        <!-- Header -->
                                        <div class="comments-heading">
                                            <h4>Comments (<small>2</small>)</h4>
                                            <div class="close-comments">
                                                <i data-feather="x"></i>
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Elise Walker</a>
                                                    <span class="time">2 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris consequat.</p>
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>1</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                    <!-- Comment -->
                                                    <div class="media is-comment">
                                                        <!-- User image -->
                                                        <div class="media-left">
                                                            <div class="image">
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Jenna Davis</a>
                                                            <span class="time">2 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore et dolore magna aliqua.</p>
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>0</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                <!-- Textarea -->
                                                <div class="media-content">
                                                    <div class="field">
                                                        <p class="control">
                                                            <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                        </p>
                                                    </div>
                                                    <!-- Additional actions -->
                                                    <div class="actions">
                                                        <div class="image is-32x32">
                                                            <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
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
                                                                <input type="file">
                                                            </div>
                                                            <a class="button is-solid primary-button raised">Post Comment</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comments footer -->
                                    </div>
                                    <!-- /Post #6 comments -->
                                </div>
                                <!-- /Post -->
                            </div>
                            <!-- /timeline POST #5 -->
                            <!-- Timeline post 6 -->
                            <!-- html/partials/pages/profile/posts/timeline-post6.html -->
                            <!-- Timeline POST #6 -->
                            <div class="profile-post is-simple">
                                <!-- Post -->
                                <div class="card is-post">
                                    <!-- Main wrap -->
                                    <div class="content-wrap">
                                        <!-- Header -->
                                        <div class="card-heading">
                                            <!-- User image -->
                                            <div class="user-block">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="2" alt="">
                                                </div>
                                                <div class="user-info">
                                                    <a href="#">Stella Bergmann shared a status on your feed</a>
                                                    <span class="time">September 12 2018, 05:49pm</span>
                                                </div>
                                            </div>

                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                <div>
                                                    <div class="button">
                                                        <i data-feather="more-vertical"></i>
                                                    </div>
                                                </div>
                                                <div class="dropdown-menu" role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bookmark"></i>
                                                                <div class="media-content">
                                                                    <h3>Bookmark</h3>
                                                                    <small>Add this post to your bookmarks.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bell"></i>
                                                                <div class="media-content">
                                                                    <h3>Notify me</h3>
                                                                    <small>Send me the updates.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <hr class="dropdown-divider">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="flag"></i>
                                                                <div class="media-content">
                                                                    <h3>Flag</h3>
                                                                    <small>In case of inappropriate content.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Header -->

                                        <!-- Post body -->
                                        <div class="card-body">
                                            <!-- Post body text -->
                                            <div class="post-text">
                                                <p>Are we going to see a movie tonight ? From what i can tell, that's what you said last week.<p>
                                            </div>
                                            <!-- Post actions -->
                                            <div class="post-actions">
                                                <div class="like-wrapper">
                                                    <a href="javascript:void(0);" class="like-button">
                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
                                                        <span class="like-overlay"></span>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-share">
                                                    <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                        <i data-feather="link-2"></i>
                                                    </a>
                                                </div>

                                                <div class="fab-wrapper is-comment">
                                                    <a href="javascript:void(0);" class="small-fab">
                                                        <i data-feather="message-circle"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post body -->

                                        <!-- Post footer -->
                                        <div class="card-footer">
                                            <!-- Followers -->
                                            <div class="likers-group">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="">
                                            </div>
                                            <div class="likers-text">
                                                <p><a href="#">Daniel</a> and <a href="#">Elise</a></p>
                                                <p>liked this</p>
                                            </div>
                                            <!-- Post statistics -->
                                            <div class="social-count">
                                                <div class="likes-count">
                                                    <i data-feather="heart"></i>
                                                    <span>2</span>
                                                </div>
                                                <div class="shares-count">
                                                    <i data-feather="link-2"></i>
                                                    <span>0</span>
                                                </div>
                                                <div class="comments-count">
                                                    <i data-feather="message-circle"></i>
                                                    <span>2</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post footer -->
                                    </div>
                                    <!-- /Main wrap -->

                                    <!-- Post #6 comments -->
                                    <div class="comments-wrap is-hidden">
                                        <!-- Header -->
                                        <div class="comments-heading">
                                            <h4>Comments (<small>2</small>)</h4>
                                            <div class="close-comments">
                                                <i data-feather="x"></i>
                                            </div>
                                        </div>
                                        <!-- /Header -->

                                        <!-- Comments body -->
                                        <div class="comments-body">

                                            <!-- Comment -->
                                            <div class="media is-comment has-slimscroll">
                                                <!-- User image -->
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Jenna Davis</a>
                                                    <span class="time">sep 12</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore et dolore magna aliqua.</p>
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>1</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="2" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Stella Bergmann</a>
                                                            <span class="time">sep 12</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore et dolore magna aliqua.</p>
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>0</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                <!-- Textarea -->
                                                <div class="media-content">
                                                    <div class="field">
                                                        <p class="control">
                                                            <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                        </p>
                                                    </div>
                                                    <!-- Additional actions -->
                                                    <div class="actions">
                                                        <div class="image is-32x32">
                                                            <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
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
                                                                <input type="file">
                                                            </div>
                                                            <a class="button is-solid primary-button raised">Post Comment</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comments footer -->
                                    </div>
                                    <!-- /Post #6 comments -->
                                </div>
                                <!-- /Post -->
                            </div>
                            <!-- /timeline POST #6 -->
                            <!-- Timeline post 7 -->
                            <!-- html/partials/pages/profile/posts/timeline-post7.html -->
                            <!-- Timeline POST #7 -->
                            <div class="profile-post">

                                <!-- Post -->
                                <div class="card is-post">
                                    <!-- Main wrap -->
                                    <div class="content-wrap">
                                        <!-- Header -->
                                        <div class="card-heading">
                                            <div class="user-block">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
                                                </div>
                                                <div class="user-info">
                                                    <a href="#">Jenna Davis</a>
                                                    <span class="time">September 26 2018, 11:18am</span>
                                                </div>
                                            </div>
                                            <!-- Right side dropdown -->
                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
                                                <div>
                                                    <div class="button">
                                                        <i data-feather="more-vertical"></i>
                                                    </div>
                                                </div>
                                                <div class="dropdown-menu" role="menu">
                                                    <div class="dropdown-content">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bookmark"></i>
                                                                <div class="media-content">
                                                                    <h3>Bookmark</h3>
                                                                    <small>Add this post to your bookmarks.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="bell"></i>
                                                                <div class="media-content">
                                                                    <h3>Notify me</h3>
                                                                    <small>Send me the updates.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <hr class="dropdown-divider">
                                                        <a href="#" class="dropdown-item">
                                                            <div class="media">
                                                                <i data-feather="flag"></i>
                                                                <div class="media-content">
                                                                    <h3>Flag</h3>
                                                                    <small>In case of inappropriate content.</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Header -->

                                        <!-- Post body -->
                                        <div class="card-body">
                                            <!-- Post body text -->
                                            <div class="post-text">
                                                <p>Hello everyone! Today iam posting a review of the latest shoe trends. I tried for you more than 30 pairs of shoes. I had some crushes and some deceptions, However, it was a great experience i would like to share with you.<p>
                                            </div>
                                            <!-- Featured image -->
                                            <div class="post-image">
                                                <!-- CSS triple wrap -->
                                                <div class="triple-grid">
                                                    <a data-fancybox="profile-post4" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/16.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/16.jpg">
                                                        <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/16.jpg" alt="">
                                                    </a>
                                                    <a class="is-half" data-fancybox="profile-post4" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/14.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/14.jpg">
                                                        <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/14.jpg" alt="">
                                                    </a>
                                                    <a class="is-half" data-fancybox="profile-post4" data-lightbox-type="comments" data-thumb="assets/img/demo/unsplash/15.jpg" href="https://via.placeholder.com/1600x900" data-demo-href="assets/img/demo/unsplash/15.jpg">
                                                        <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/15.jpg" alt="">
                                                    </a>
                                                    <!-- Post actions -->
                                                    <div class="like-wrapper">
                                                        <a href="javascript:void(0);" class="like-button">
                                                            <i class="mdi mdi-heart not-liked bouncy"></i>
                                                            <i class="mdi mdi-heart is-liked bouncy"></i>
                                                            <span class="like-overlay"></span>
                                                        </a>
                                                    </div>

                                                    <div class="fab-wrapper is-share">
                                                        <a href="javascript:void(0);" class="small-fab share-fab modal-trigger" data-modal="share-modal">
                                                            <i data-feather="link-2"></i>
                                                        </a>
                                                    </div>

                                                    <div class="fab-wrapper is-comment">
                                                        <a href="javascript:void(0);" class="small-fab">
                                                            <i data-feather="message-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post body -->

                                        <!-- Post footer -->
                                        <div class="card-footer">
                                            <!-- Followers -->
                                            <div class="likers-group">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/rolf.jpg" data-user-popover="13" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/mike.jpg" data-user-popover="12" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="3" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" data-user-popover="6" alt="">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt="">
                                            </div>
                                            <div class="likers-text">
                                                <p>
                                                    <a href="#">Mike</a>,
                                                    <a href="#">Rolf</a>
                                                </p>
                                                <p>and 31 more liked this</p>
                                            </div>
                                            <!-- Post statistics -->
                                            <div class="social-count">
                                                <div class="likes-count">
                                                    <i data-feather="heart"></i>
                                                    <span>33</span>
                                                </div>
                                                <div class="shares-count">
                                                    <i data-feather="link-2"></i>
                                                    <span>3</span>
                                                </div>
                                                <div class="comments-count">
                                                    <i data-feather="message-circle"></i>
                                                    <span>8</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Post footer -->
                                    </div>
                                    <!-- Main wrap -->

                                    <!-- Comments -->
                                    <div class="comments-wrap is-hidden">
                                        <!-- Header -->
                                        <div class="comments-heading">
                                            <h4>Comments
                                                <small>(8)</small></h4>
                                            <div class="close-comments">
                                                <i data-feather="x"></i>
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="4" alt=""> data-user-popover="2" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Stella Bergmann</a>
                                                    <span class="time">17 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris consequat.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>0</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="4" alt=""> data-user-popover="0" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Jenna Davis</a>
                                                            <span class="time">17 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>4</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt=""> data-user-popover="4" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">David Kim</a>
                                                            <span class="time">17 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>1</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" data-user-popover="4" alt=""> data-user-popover="7" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Milly Augustine</a>
                                                            <span class="time">17 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>1</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" data-user-popover="4" alt=""> data-user-popover="3" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Daniel Wellington</a>
                                                    <span class="time">17 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo.</p>
                                                    <!-- Comment actions -->
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>6</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" data-user-popover="4" alt=""> data-user-popover="4" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">David Kim</a>
                                                    <span class="time">18 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                        et dolore magna aliqua.</p>
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>5</span>
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
                                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" data-user-popover="4" alt=""> data-user-popover="2" alt="">
                                                            </div>
                                                        </div>
                                                        <!-- Content -->
                                                        <div class="media-content">
                                                            <a href="#">Stella Bergmann</a>
                                                            <span class="time">18 days ago</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore
                                                                et dolore magna aliqua.</p>
                                                            <!-- Comment actions -->
                                                            <div class="controls">
                                                                <div class="like-count">
                                                                    <i data-feather="thumbs-up"></i>
                                                                    <span>7</span>
                                                                </div>
                                                                <div class="reply">
                                                                    <a href="#">Reply</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Right side dropdown -->
                                                        <div class="media-right">
                                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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
                                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/mike.jpg" data-user-popover="4" alt=""> data-user-popover="12" alt="">
                                                    </div>
                                                </div>
                                                <!-- Content -->
                                                <div class="media-content">
                                                    <a href="#">Mike Lasalle</a>
                                                    <span class="time">20 days ago</span>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt.</p>
                                                    <div class="controls">
                                                        <div class="like-count">
                                                            <i data-feather="thumbs-up"></i>
                                                            <span>5</span>
                                                        </div>
                                                        <div class="reply">
                                                            <a href="#">Reply</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Right side dropdown -->
                                                <div class="media-right">
                                                    <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
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

                                            <!-- Load More comments -->
                                            <div class="load-more has-text-centered">
                                                <button class="load-more-button">
                                                    <i data-feather="more-horizontal"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <!-- /Comments body -->

                                        <!-- Comments footer -->
                                        <div class="card-footer">
                                            <div class="media post-comment has-emojis">
                                                <!-- Textarea -->
                                                <div class="media-content">
                                                    <div class="field">
                                                        <p class="control">
                                                            <textarea class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                                                        </p>
                                                    </div>
                                                    <!-- Additional actions -->
                                                    <div class="actions">
                                                        <div class="image is-32x32">
                                                            <img class="is-rounded" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/jenna.png" data-user-popover="0" alt="">
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
                                                                <input type="file">
                                                            </div>
                                                            <a class="button is-solid primary-button raised">Post Comment</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Comments footer -->
                                    </div>
                                    <!-- /Comments -->
                                </div>
                                <!-- /Post -->
                            </div>
                            <!-- /timeline POST #7 -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Profile page main wrapper -->

        </div>
        <!-- /Container -->

        <!-- Change cover image modal -->
        <!--html/partials/pages/profile/timeline/modals/change-cover-modal.html-->
        <div id="change-cover-modal" class="modal change-cover-modal is-medium has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">

                <div class="card">
                    <div class="card-heading">
                        <h3>Update Cover</h3>
                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- Placeholder -->
                        <div class="selection-placeholder">
                            <div class="columns">
                                <div class="column is-6">
                                    <!-- Selection box -->
                                    <div class="selection-box modal-trigger" data-modal="upload-crop-cover-modal">
                                        <div class="box-content">
                                            <img src="assets/img/illustrations/profile/upload-cover.svg" alt="">
                                            <div class="box-text">
                                                <span>Upload</span>
                                                <span>From your computer</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="column is-6">
                                    <!-- Selection box -->
                                    <div class="selection-box modal-trigger" data-modal="user-photos-modal">
                                        <div class="box-content">
                                            <img src="assets/img/illustrations/profile/change-cover.svg" alt="">
                                            <div class="box-text">
                                                <span>Choose</span>
                                                <span>From your photos</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Change profile pic modal -->
        <!--html/partials/pages/profile/timeline/modals/change-profile-pic-modal.html-->
        <div id="change-profile-pic-modal" class="modal change-profile-pic-modal is-medium has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">

                <div class="card">
                    <div class="card-heading">
                        <h3>Update Profile Picture</h3>
                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- Placeholder -->
                        <div class="selection-placeholder">
                            <div class="columns">
                                <div class="column is-6">
                                    <!-- Selection box -->
                                    <div class="selection-box modal-trigger" data-modal="upload-crop-profile-modal">
                                        <div class="box-content">
                                            <img src="assets/img/illustrations/profile/change-profile.svg" alt="">
                                            <div class="box-text">
                                                <span>Upload</span>
                                                <span>From your computer</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="column is-6">
                                    <!-- Selection box -->
                                    <div class="selection-box modal-trigger" data-modal="user-photos-modal">
                                        <div class="box-content">
                                            <img src="assets/img/illustrations/profile/upload-profile.svg" alt="">
                                            <div class="box-text">
                                                <span>Choose</span>
                                                <span>From your photos</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- User photos and albums -->
        <!--html/partials/pages/profile/timeline/modals/user-photos-modal.html-->
        <div id="user-photos-modal" class="modal user-photos-modal is-medium has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">
                <!-- Card -->
                <div class="card">
                    <div class="card-heading">
                        <h3>Choose a picture</h3>
                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                        </div>
                    </div>
                    <!-- Card body -->
                    <div class="card-body">
                        <!-- Tabs -->
                        <div class="nav-tabs-wrapper">
                            <div class="tabs">
                                <ul class="is-faded">
                                    <li class="is-active" data-tab="recent-photos"><a>Recent</a></li>
                                    <li data-tab="all-photos"><a>Photos</a></li>
                                    <li data-tab="photo-albums"><a>Albums</a></li>
                                </ul>
                            </div>

                            <!-- Recent Photos -->
                            <div id="recent-photos" class="tab-content has-slimscroll-md is-active">
                                <!-- Grid -->
                                <div class="image-grid">
                                    <div class="columns is-multiline">
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/3.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/4.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/9.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/2.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/13.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/11.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/17.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/22.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/8.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/18.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/20.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/21.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- All photos -->
                            <div id="all-photos" class="tab-content has-slimscroll-md">
                                <!-- Grid -->
                                <div class="image-grid">
                                    <div class="columns is-multiline">
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/19.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/25.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/23.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/28.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/34.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/27.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/18.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/30.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/26.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/29.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/20.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/17.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/11.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/24.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/32.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/31.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/33.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/35.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Load more images -->
                                <div class=" load-more-wrap has-text-centered">
                                    <a href="#" class="load-more-button">Load More</a>
                                </div>
                                <!-- /Load more images -->
                            </div>

                            <!-- Albums -->
                            <div id="photo-albums" class="tab-content has-slimscroll-md">
                                <!-- Grid -->
                                <div class="albums-grid">
                                    <div class="columns is-multiline">
                                        <!-- Album item -->
                                        <div class="column is-6">
                                            <div class="album-wrapper" data-album="album-photos-1">
                                                <div class="album-image">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/35.jpg" alt="">
                                                </div>
                                                <div class="album-meta">
                                                    <div class="album-title">
                                                        <span>Design and Colors</span>
                                                        <span>Added on sep 06 2018</span>
                                                    </div>
                                                    <div class="image-count">
                                                        <i data-feather="image"></i>
                                                        <span>8</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Album item -->
                                        <div class="column is-6">
                                            <div class="album-wrapper" data-album="album-photos-2">
                                                <div class="album-image">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/19.jpg" alt="">
                                                </div>
                                                <div class="album-meta">
                                                    <div class="album-title">
                                                        <span>Friends and Family</span>
                                                        <span>Added on jun 10 2016</span>
                                                    </div>
                                                    <div class="image-count">
                                                        <i data-feather="image"></i>
                                                        <span>29</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Album item -->
                                        <div class="column is-6">
                                            <div class="album-wrapper" data-album="album-photos-3">
                                                <div class="album-image">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/4.jpg" alt="">
                                                </div>
                                                <div class="album-meta">
                                                    <div class="album-title">
                                                        <span>Trips and Travel</span>
                                                        <span>Added on feb 14 2017</span>
                                                    </div>
                                                    <div class="image-count">
                                                        <i data-feather="image"></i>
                                                        <span>12</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Album item -->
                                        <div class="column is-6">
                                            <div class="album-wrapper" data-album="album-photos-4">
                                                <div class="album-image">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/3.jpg" alt="">
                                                </div>
                                                <div class="album-meta">
                                                    <div class="album-title">
                                                        <span>Summer 2017</span>
                                                        <span>Added on aug 23 2017</span>
                                                    </div>
                                                    <div class="image-count">
                                                        <i data-feather="image"></i>
                                                        <span>32</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Album item -->
                                        <div class="column is-6">
                                            <div class="album-wrapper" data-album="album-photos-5">
                                                <div class="album-image">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/20.jpg" alt="">
                                                </div>
                                                <div class="album-meta">
                                                    <div class="album-title">
                                                        <span>Winter 2017</span>
                                                        <span>Added on jan 07 2017</span>
                                                    </div>
                                                    <div class="image-count">
                                                        <i data-feather="image"></i>
                                                        <span>7</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Album item -->
                                        <div class="column is-6">
                                            <div class="album-wrapper" data-album="album-photos-6">
                                                <div class="album-image">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/2.jpg" alt="">
                                                </div>
                                                <div class="album-meta">
                                                    <div class="album-title">
                                                        <span>Thanksgiving 2017</span>
                                                        <span>Added on nov 30 2017</span>
                                                    </div>
                                                    <div class="image-count">
                                                        <i data-feather="image"></i>
                                                        <span>6</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Hidden Grid | Design and colors -->
                                <div id="album-photos-1" class="album-image-grid is-hidden">
                                    <div class="album-info">
                                        <h4>Design and Colors | <small>8 photo(s)</small></h4>
                                        <a class="close-nested-photos">Go Back</a>
                                    </div>
                                    <div class="columns is-multiline">
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/35.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/17.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/30.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/28.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/32.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/27.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/18.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/26.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Load more images -->
                                    <div class=" load-more-wrap has-text-centered">
                                        <a href="#" class="load-more-button">Load More</a>
                                    </div>
                                    <!-- /Load more images -->
                                </div>

                                <!-- Hidden Grid | Friends and Family -->
                                <div id="album-photos-2" class="album-image-grid is-hidden">
                                    <div class="album-info">
                                        <h4>Friends and Family | <small>29 photo(s)</small></h4>
                                        <a class="close-nested-photos">Go Back</a>
                                    </div>
                                    <div class="columns is-multiline">
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/23.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/22.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/19.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/20.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/2.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/21.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/38.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/36.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/37.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Load more images -->
                                    <div class=" load-more-wrap has-text-centered">
                                        <a href="#" class="load-more-button">Load More</a>
                                    </div>
                                    <!-- /Load more images -->
                                </div>

                                <!-- Hidden Grid | Trips and Travel -->
                                <div id="album-photos-3" class="album-image-grid is-hidden">
                                    <div class="album-info">
                                        <h4>Trips and Travel | <small>12 photo(s)</small></h4>
                                        <a class="close-nested-photos">Go Back</a>
                                    </div>
                                    <div class="columns is-multiline">
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/4.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/6.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/5.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/38.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/37.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/18.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/19.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/3.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/32.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Hidden Grid | Summer 2017 -->
                                <div id="album-photos-4" class="album-image-grid is-hidden">
                                    <div class="album-info">
                                        <h4>Summer 2017 | <small>32 photo(s)</small></h4>
                                        <a class="close-nested-photos">Go Back</a>
                                    </div>
                                    <div class="columns is-multiline">
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/4.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/6.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/5.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/38.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/37.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/18.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/19.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/3.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/32.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Load more images -->
                                    <div class=" load-more-wrap has-text-centered">
                                        <a href="#" class="load-more-button">Load More</a>
                                    </div>
                                    <!-- /Load more images -->
                                </div>

                                <!-- Hidden Grid | Winter 2017 -->
                                <div id="album-photos-5" class="album-image-grid is-hidden">
                                    <div class="album-info">
                                        <h4>Winter 2017 | <small>7 photo(s)</small></h4>
                                        <a class="close-nested-photos">Go Back</a>
                                    </div>
                                    <div class="columns is-multiline">
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/22.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/24.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/36.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/25.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/2.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/8.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/12.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Hidden Grid | Thanksgiving 2017 -->
                                <div id="album-photos-6" class="album-image-grid is-hidden">
                                    <div class="album-info">
                                        <h4>Thanksgiving 2017 | <small>6 photo(s)</small></h4>
                                        <a class="close-nested-photos">Go Back</a>
                                    </div>
                                    <div class="columns is-multiline">
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/23.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/22.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/19.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/20.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/2.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Grid item -->
                                        <div class="column is-4">
                                            <div class="grid-image">
                                                <input type="radio" name="selected_photos">
                                                <div class="inner">
                                                    <img src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/21.jpg" alt="">
                                                    <div class="inner-overlay"></div>
                                                    <div class="indicator gelatine">
                                                        <i data-feather="check"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button class="button is-solid accent-button replace-button is-disabled">Use Picture</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- Profile picture crop modal -->
        <!--html/partials/pages/profile/timeline/modals/upload-crop-profile-modal.html-->
        <div id="upload-crop-profile-modal" class="modal upload-crop-profile-modal is-xsmall has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">

                <div class="card">
                    <div class="card-heading">
                        <h3>Upload Picture</h3>
                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                        </div>
                    </div>
                    <div class="card-body">
                        <label class="profile-uploader-box" for="upload-profile-picture">
                            <span class="inner-content">
                                    <img src="assets/img/illustrations/profile/add-profile.svg" alt="">
                                    <span>Click here to <br>upload a profile picture</span>
                            </span>
                            <input type="file" id="upload-profile-picture" accept="image/*">
                        </label>
                        <div class="upload-demo-wrap is-hidden">
                            <div id="upload-profile"></div>
                            <div class="upload-help">
                                <a id="profile-upload-reset" class="profile-reset is-hidden">Reset Picture</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button id="submit-profile-picture" class="button is-solid accent-button is-fullwidth raised is-disabled">Use Picture</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- Cover image crop modal -->
        <!--html/partials/pages/profile/timeline/modals/upload-crop-cover-modal.html-->
        <div id="upload-crop-cover-modal" class="modal upload-crop-cover-modal is-large has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">

                <div class="card">
                    <div class="card-heading">
                        <h3>Upload Cover</h3>
                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                        </div>
                    </div>
                    <div class="card-body">
                        <label class="cover-uploader-box" for="upload-cover-picture">
                            <span class="inner-content">
                                    <img src="assets/img/illustrations/profile/add-cover.svg" alt="">
                                    <span>Click here to <br>upload a cover image</span>
                            </span>
                            <input type="file" id="upload-cover-picture" accept="image/*">
                        </label>
                        <div class="upload-demo-wrap is-hidden">
                            <div id="upload-cover"></div>
                            <div class="upload-help">
                                <a id="cover-upload-reset" class="cover-reset is-hidden">Reset Picture</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button id="submit-cover-picture" class="button is-solid accent-button is-fullwidth raised is-disabled">Use
                            Picture</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- Share modal -->
        <!-- /partials/pages/feed/modals/share-modal.html -->
        <div id="share-modal" class="modal share-modal is-xsmall has-light-bg">
            <div class="modal-background"></div>
            <div class="modal-content">

                <div class="card">
                    <div class="card-heading">
                        <div class="dropdown is-primary share-dropdown">
                            <div>
                                <div class="button">
                                    <i class="mdi mdi-format-float-left"></i> <span>Share in your feed</span> <i
                                            data-feather="chevron-down"></i>
                                </div>
                            </div>
                            <div class="dropdown-menu" role="menu">
                                <div class="dropdown-content">
                                    <div class="dropdown-item" data-target-channel="feed">
                                        <div class="media">
                                            <i class="mdi mdi-format-float-left"></i>
                                            <div class="media-content">
                                                <h3>Share in your feed</h3>
                                                <small>Share this publication on your feed.</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-item" data-target-channel="friend">
                                        <div class="media">
                                            <i class="mdi mdi-account-heart"></i>
                                            <div class="media-content">
                                                <h3>Share in a friend's feed</h3>
                                                <small>Share this publication on a friend's feed.</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-item" data-target-channel="group">
                                        <div class="media">
                                            <i class="mdi mdi-account-group"></i>
                                            <div class="media-content">
                                                <h3>Share in a group</h3>
                                                <small>Share this publication in a group.</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-item" data-target-channel="page">
                                        <div class="media">
                                            <i class="mdi mdi-file-document-box"></i>
                                            <div class="media-content">
                                                <h3>Share in a page</h3>
                                                <small>Share this publication in a page.</small>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="dropdown-divider">
                                    <div class="dropdown-item" data-target-channel="private-message">
                                        <div class="media">
                                            <i class="mdi mdi-email-plus"></i>
                                            <div class="media-content">
                                                <h3>Share in message</h3>
                                                <small>Share this publication in a private message.</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Close X button -->
                        <div class="close-wrap">
                            <span class="close-modal">
                                    <i data-feather="x"></i>
                                </span>
                        </div>
                    </div>
                    <div class="share-inputs">
                        <div class="field is-autocomplete">
                            <div id="share-to-friend" class="control share-channel-control is-hidden">
                                <input id="share-with-friend" type="text" class="input is-sm no-radius share-input simple-users-autocpl" placeholder="Your friend's name">
                                <div class="input-heading">
                                    Friend :
                                </div>
                            </div>
                        </div>

                        <div class="field is-autocomplete">
                            <div id="share-to-group" class="control share-channel-control is-hidden">
                                <input id="share-with-group" type="text" class="input is-sm no-radius share-input simple-groups-autocpl" placeholder="Your group's name">
                                <div class="input-heading">
                                    Group :
                                </div>
                            </div>
                        </div>

                        <div id="share-to-page" class="control share-channel-control no-border is-hidden">
                            <div class="page-controls">
                                <div class="page-selection">

                                    <div class="dropdown is-accent page-dropdown">
                                        <div>
                                            <div class="button page-selector">
                                                <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/hanzo.svg" alt=""> <span>Css Ninja</span> <i
                                                        data-feather="chevron-down"></i>
                                            </div>
                                        </div>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="dropdown-content">
                                                <div class="dropdown-item">
                                                    <div class="media">
                                                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/hanzo.svg" alt="">
                                                        <div class="media-content">
                                                            <h3>Css Ninja</h3>
                                                            <small>Share on Css Ninja.</small>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="dropdown-item">
                                                    <div class="media">
                                                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/icons/logos/nuclearjs.svg" alt="">
                                                        <div class="media-content">
                                                            <h3>NuclearJs</h3>
                                                            <small>Share on NuclearJs.</small>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="dropdown-item">
                                                    <div class="media">
                                                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/icons/logos/slicer.svg" alt="">
                                                        <div class="media-content">
                                                            <h3>Slicer</h3>
                                                            <small>Share on Slicer.</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="alias">
                                    <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/jenna.png" alt="">
                                </div>
                            </div>
                        </div>

                        <div class="field is-autocomplete">
                            <div id="share-to-private-message" class="control share-channel-control is-hidden">
                                <input id="share-with-private-message" type="text" class="input is-sm no-radius share-input simple-users-autocpl" placeholder="Message a friend">
                                <div class="input-heading">
                                    To :
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="control">
                            <textarea class="textarea comment-textarea" rows="1" placeholder="Say something about this ..."></textarea>
                            <button class="emoji-button">
                                <i data-feather="smile"></i>
                            </button>
                        </div>
                        <div class="shared-publication">
                            <div class="featured-image">
                                <img id="share-modal-image" src="https://via.placeholder.com/1600x900" data-demo-src="assets/img/demo/unsplash/1.jpg" alt="">
                            </div>
                            <div class="publication-meta">
                                <div class="inner-flex">
                                    <img id="share-modal-avatar" src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="">
                                    <p id="share-modal-text">Yesterday with <a href="#">@Karen Miller</a> and <a href="#">@Marvin Stemperd</a> at the
                                        <a href="#">#Rock'n'Rolla</a> concert in LA. Was totally fantastic! People were really
                                        excited about this one!</p>
                                </div>
                                <div class="publication-footer">
                                    <div class="stats">
                                        <div class="stat-block">
                                            <i class="mdi mdi-earth"></i>
                                            <small>Public</small>
                                        </div>
                                        <div class="stat-block">
                                            <i class="mdi mdi-eye"></i>
                                            <small>163 views</small>
                                        </div>
                                    </div>
                                    <div class="publication-origin">
                                        <small>Friendkit.io</small>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="bottom-share-inputs">

                        <div id="action-place" class="field is-autocomplete is-dropup is-hidden">
                            <div id="share-place" class="control share-bottom-channel-control">
                                <input type="text" class="input is-sm no-radius share-input simple-locations-autocpl" placeholder="Where are you?">
                                <div class="input-heading">
                                    Location :
                                </div>
                            </div>
                        </div>

                        <div id="action-tag" class="field is-autocomplete is-dropup is-hidden">
                            <div id="share-tags" class="control share-bottom-channel-control">
                                <input id="share-friend-tags-autocpl" type="text" class="input is-sm no-radius share-input" placeholder="Who are you with">
                                <div class="input-heading">
                                    Friends :
                                </div>
                            </div>
                            <div id="share-modal-tag-list" class="tag-list no-margin"></div>
                        </div>

                    </div>
                    <div class="card-footer">
                        <div class="action-wrap">
                            <div class="footer-action" data-target-action="tag">
                                <i class="mdi mdi-account-plus"></i>
                            </div>
                            <div class="footer-action" data-target-action="place">
                                <i class="mdi mdi-map-marker"></i>
                            </div>
                            <div class="footer-action dropdown is-spaced is-neutral dropdown-trigger is-up" data-target-action="permissions">
                                <div>
                                    <i class="mdi mdi-lock-clock"></i>
                                </div>
                                <div class="dropdown-menu" role="menu">
                                    <div class="dropdown-content">
                                        <a href="#" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="globe"></i>
                                                <div class="media-content">
                                                    <h3>Public</h3>
                                                    <small>Anyone can see this publication.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="users"></i>
                                                <div class="media-content">
                                                    <h3>Friends</h3>
                                                    <small>only friends can see this publication.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="user"></i>
                                                <div class="media-content">
                                                    <h3>Specific friends</h3>
                                                    <small>Don't show it to some friends.</small>
                                                </div>
                                            </div>
                                        </a>
                                        <hr class="dropdown-divider">
                                        <a class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="lock"></i>
                                                <div class="media-content">
                                                    <h3>Only me</h3>
                                                    <small>Only me can see this publication.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="button-wrap">
                            <button type="button" class="button is-solid dark-grey-button close-modal">Cancel</button>
                            <button type="button" class="button is-solid primary-button close-modal">Publish</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
</body>
</html>