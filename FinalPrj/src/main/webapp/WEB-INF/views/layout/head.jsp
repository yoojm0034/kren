<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- Pageloader -->
    <div class="pageloader"></div>
    <div class="infraloader is-active"></div>
    <div class="app-overlay"></div>

    <div id="main-navbar" class="navbar navbar-v1 is-inline-flex is-transparent no-shadow is-hidden-mobile">
        <div class="container is-fluid">
            <div class="navbar-brand">
                <a href="/" class="navbar-item">
                    <img class="logo light-image" src="resources/template/assets/img/logo/krenlogo.png" width="112" height="28" alt="">
                    <img class="logo dark-image" src="resources/template/assets/img/logo/friendkit-white.svg" width="112" height="28" alt="">
                </a>
            </div>
            <div class="navbar-menu">
                <div class="navbar-start">
                    <!-- Navbar Search -->

                    <div class="navbar-item is-icon drop-trigger">
                        <a class="icon-link is-friends" href="javascript:void(0);">
                            <i data-feather="heart"></i>
                            <span class="indicator"></span>
                        </a>

                        <div class="nav-drop">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span>Friend requests</span>
                                    <a href="#">
                                        <i data-feather="search"></i>
                                    </a>
                                </div>
                                <div class="nav-drop-body is-friend-requests">
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/bobby.jpg" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Bobby Brown</a>
                                            <span>Najeel verwick is a common friend</span>
                                        </div>
                                        <div class="media-right">
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-plus"></i>
                                            </button>
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Dan Walker</a>
                                            <span>You have 4 common friends</span>
                                        </div>
                                        <div class="media-right">
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-plus"></i>
                                            </button>
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span>You are now friends with <a href="#">Nelly Schwartz</a>. Check her <a href="#">profile</a>.</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="tag"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Milly Augustine</a>
                                            <span>You have 8 common friends</span>
                                        </div>
                                        <div class="media-right">
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-plus"></i>
                                            </button>
                                            <button class="button icon-button is-solid grey-button raised">
                                                <i data-feather="user-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span>You are now friends with <a href="#">Elise Walker</a>. Check her <a href="#">profile</a>.</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="tag"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Friend request -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span>You are now friends with <a href="#">Edward Mayers</a>. Check his <a href="#">profile</a>.</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="tag"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="nav-drop-footer">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="navbar-item is-icon drop-trigger">
                        <a class="icon-link" href="javascript:void(0);">
                            <i data-feather="bell"></i>
                            <span class="indicator"></span>
                        </a>

                        <div class="nav-drop">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span>Notifications</span>
                                    <a href="#">
                                        <i data-feather="bell"></i>
                                    </a>
                                </div>
                                <div class="nav-drop-body is-notifications">
                                    <!-- Notification -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span><a href="#">David Kim</a> commented on <a href="#">your post</a>.</span>
                                            <span class="time">30 minutes ago</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="message-square"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Notification -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span><a href="#">Daniel Wellington</a> liked your <a href="#">profile.</a></span>
                                            <span class="time">43 minutes ago</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="heart"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Notification -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span><a href="#">Stella Bergmann</a> shared a <a href="#">New video</a> on your wall.</span>
                                            <span class="time">Yesterday</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="youtube"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Notification -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span><a href="#">Elise Walker</a> shared an <a href="#">Image</a> with you an 2 other people.</span>
                                            <span class="time">2 days ago</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="image"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="nav-drop-footer">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="navbar-item is-icon drop-trigger">
                        <a class="icon-link is-active" href="javascript:void(0);">
                            <i data-feather="mail"></i>
                            <span class="indicator"></span>
                        </a>

                        <div class="nav-drop">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span>Messages</span>
                                    <a href="messages-inbox.html">Inbox</a>
                                </div>
                                <div class="nav-drop-body is-friend-requests">
                                    <!-- Message -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Nelly Schwartz</a>
                                            <span>I think we should meet near the Starbucks so we can get...</span>
                                            <span class="time">Yesterday</span>
                                        </div>
                                        <div class="media-right is-centered">
                                            <div class="added-icon">
                                                <i data-feather="message-square"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Message -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Edward Mayers</a>
                                            <span>That was a real pleasure seeing you last time we really should...</span>
                                            <span class="time">last week</span>
                                        </div>
                                        <div class="media-right is-centered">
                                            <div class="added-icon">
                                                <i data-feather="message-square"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Message -->
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <a href="#">Dan Walker</a>
                                            <span>Hey there, would it be possible to borrow your bicycle, i really need...</span>
                                            <span class="time">Jun 03 2018</span>
                                        </div>
                                        <div class="media-right is-centered">
                                            <div class="added-icon">
                                                <i data-feather="message-square"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="nav-drop-footer">
                                    <a href="#">Clear All</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="navbar-item is-icon open-chat">
                        <a class="icon-link is-primary" href="javascript:void(0);">
                            <i data-feather="message-square"></i>
                            <span class="indicator"></span>
                        </a>
                    </div>

                    <div id="explorer-trigger" class="navbar-item is-icon">
                        <a class="icon-link is-primary">
                            <i class="mdi mdi-apps"></i>
                        </a>
                    </div>
                </div>

                <div class="navbar-end">

                    <div class="navbar-item">
                        <div id="global-search" class="control">
                            <input id="tipue_drop_input" class="input is-rounded" type="text" placeholder="Search" required>
                            <span id="clear-search" class="reset-search">
                                    <i data-feather="x"></i>
                                </span>
                            <span class="search-icon">
                                    <i data-feather="search"></i>
                                </span>

                            <div id="tipue_drop_content" class="tipue-drop-content"></div>
                        </div>

                    </div>
                    <div class="navbar-item is-cart">
                        <div class="cart-button">
                            <i data-feather="shopping-cart"></i>
                            <div class="cart-count">
                            </div>
                        </div>

                        <!-- Cart dropdown -->
                        <div class="shopping-cart">
                            <div class="cart-inner">

                                <!--Loader-->
                                <div class="navbar-cart-loader is-active">
                                    <div class="loader is-loading"></div>
                                </div>

                                <div class="shopping-cart-header">
                                    <a href="/ecommerce-cart.html" class="cart-link">View Cart</a>
                                    <div class="shopping-cart-total">
                                        <span class="lighter-text">Total:</span>
                                        <span class="main-color-text">$193.00</span>
                                    </div>
                                </div>
                                <!--end shopping-cart-header -->

                                <ul class="shopping-cart-items">
                                    <li class="cart-row">
                                        <img src="assets/img/products/2.svg" alt="" />
                                        <span class="item-meta">
                                                <span class="item-name">Cool Shirt</span>
                                        <span class="meta-info">
                                                    <span class="item-price">$29.00</span>
                                        <span class="item-quantity">Qty: 01</span>
                                        </span>
                                        </span>
                                    </li>

                                    <li class="cart-row">
                                        <img src="assets/img/products/3.svg" alt="" />
                                        <span class="item-meta">
                                                <span class="item-name">Military Short</span>
                                        <span class="meta-info">
                                                    <span class="item-price">$39.00</span>
                                        <span class="item-quantity">Qty: 01</span>
                                        </span>
                                        </span>
                                    </li>

                                    <li class="cart-row">
                                        <img src="assets/img/products/4.svg" alt="" />
                                        <span class="item-meta">
                                                <span class="item-name">Cool Backpack</span>
                                        <span class="meta-info">
                                                    <span class="item-price">$125.00</span>
                                        <span class="item-quantity">Qty: 01</span>
                                        </span>
                                        </span>
                                    </li>
                                </ul>

                                <a href="#" class="button primary-button is-raised">Checkout</a>
                            </div>
                        </div>
                    </div>
                    <div id="account-dropdown" class="navbar-item is-account drop-trigger has-caret">
                        <div class="user-image">
                            <img src="https://via.placeholder.com/400x400" data-demo-src="assets/img/avatars/jenna.png" alt="">
                            <span class="indicator"></span>
                        </div>

                        <div class="nav-drop is-account-dropdown">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span class="username">Jenna Davis</span>
                                    <label class="theme-toggle">
                                        <input type="checkbox">
                                        <span class="toggler">
                                                <span class="dark">
                                                    <i data-feather="moon"></i>
                                                </span>
                                        <span class="light">
                                                    <i data-feather="sun"></i>
                                                </span>
                                        </span>
                                    </label>
                                </div>
                                <div class="nav-drop-body account-items">
                                    <a id="profile-link" href="/profile-main.html" class="account-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/400x400" data-demo-src="assets/img/avatars/jenna.png" alt="">
                                                </div>
                                            </div>
                                            <div class="media-content">
                                                <h3>Jenna Davis</h3>
                                                <small>Main account</small>
                                            </div>
                                            <div class="media-right">
                                                <i data-feather="check"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <hr class="account-divider">
                                    <a href="/pages-main.html" class="account-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/hanzo.svg" alt="">
                                                </div>
                                            </div>
                                            <div class="media-content">
                                                <h3>Css Ninja</h3>
                                                <small>Company page</small>
                                            </div>
                                            <div class="media-right is-hidden">
                                                <i data-feather="check"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="/pages-main.html" class="account-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/icons/logos/fastpizza.svg" alt="">
                                                </div>
                                            </div>
                                            <div class="media-content">
                                                <h3>Fast Pizza</h3>
                                                <small>Company page</small>
                                            </div>
                                            <div class="media-right is-hidden">
                                                <i data-feather="check"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="/pages-main.html" class="account-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/icons/logos/slicer.svg" alt="">
                                                </div>
                                            </div>
                                            <div class="media-content">
                                                <h3>Slicer</h3>
                                                <small>Company page</small>
                                            </div>
                                            <div class="media-right is-hidden">
                                                <i data-feather="check"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <hr class="account-divider">
                                    <a href="/options-settings.html" class="account-item">
                                        <div class="media">
                                            <div class="icon-wrap">
                                                <i data-feather="settings"></i>
                                            </div>
                                            <div class="media-content">
                                                <h3>Settings</h3>
                                                <small>Access widget settings.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="account-item">
                                        <div class="media">
                                            <div class="icon-wrap">
                                                <i data-feather="life-buoy"></i>
                                            </div>
                                            <div class="media-content">
                                                <h3>Help</h3>
                                                <small>Contact our support.</small>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="account-item">
                                        <div class="media">
                                            <div class="icon-wrap">
                                                <i data-feather="power"></i>
                                            </div>
                                            <div class="media-content">
                                                <h3>Log out</h3>
                                                <small>Log out from your account.</small>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <nav class="navbar mobile-navbar is-hidden-desktop" aria-label="main navigation">
        <!-- Brand -->
        <div class="navbar-brand">
            <a class="navbar-item" href="/">
                <img class="light-image" src="assets/img/logo/friendkit-bold.svg" alt="">
                <img class="dark-image" src="assets/img/logo/friendkit-white.svg" alt="">
            </a>

            <div class="navbar-item is-icon drop-trigger">
                <a class="icon-link is-friends" href="javascript:void(0);">
                    <i data-feather="heart"></i>
                    <span class="indicator"></span>
                </a>

                <div class="nav-drop">
                    <div class="inner">
                        <div class="nav-drop-header">
                            <span>Friend requests</span>
                            <a href="#">
                                <i data-feather="search"></i>
                            </a>
                        </div>
                        <div class="nav-drop-body is-friend-requests">
                            <!-- Friend request -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/bobby.jpg" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <a href="#">Bobby Brown</a>
                                    <span>Najeel verwick is a common friend</span>
                                </div>
                                <div class="media-right">
                                    <button class="button icon-button is-solid grey-button raised">
                                        <i data-feather="user-plus"></i>
                                    </button>
                                    <button class="button icon-button is-solid grey-button raised">
                                        <i data-feather="user-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- Friend request -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/dan.jpg" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <a href="#">Dan Walker</a>
                                    <span>You have 4 common friends</span>
                                </div>
                                <div class="media-right">
                                    <button class="button icon-button is-solid grey-button raised">
                                        <i data-feather="user-plus"></i>
                                    </button>
                                    <button class="button icon-button is-solid grey-button raised">
                                        <i data-feather="user-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- Friend request -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/nelly.png" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <span>You are now friends with <a href="#">Nelly Schwartz</a>. Check her <a href="#">profile</a>.</span>
                                </div>
                                <div class="media-right">
                                    <div class="added-icon">
                                        <i data-feather="tag"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- Friend request -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/milly.jpg" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <a href="#">Milly Augustine</a>
                                    <span>You have 8 common friends</span>
                                </div>
                                <div class="media-right">
                                    <button class="button icon-button is-solid grey-button raised">
                                        <i data-feather="user-plus"></i>
                                    </button>
                                    <button class="button icon-button is-solid grey-button raised">
                                        <i data-feather="user-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- Friend request -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <span>You are now friends with <a href="#">Elise Walker</a>. Check her <a href="#">profile</a>.</span>
                                </div>
                                <div class="media-right">
                                    <div class="added-icon">
                                        <i data-feather="tag"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- Friend request -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/edward.jpeg" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <span>You are now friends with <a href="#">Edward Mayers</a>. Check his <a href="#">profile</a>.</span>
                                </div>
                                <div class="media-right">
                                    <div class="added-icon">
                                        <i data-feather="tag"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="nav-drop-footer">
                            <a href="#">View All</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="navbar-item is-icon drop-trigger">
                <a class="icon-link" href="javascript:void(0);">
                    <i data-feather="bell"></i>
                    <span class="indicator"></span>
                </a>

                <div class="nav-drop">
                    <div class="inner">
                        <div class="nav-drop-header">
                            <span>Notifications</span>
                            <a href="#">
                                <i data-feather="bell"></i>
                            </a>
                        </div>
                        <div class="nav-drop-body is-notifications">
                            <!-- Notification -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/david.jpg" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <span><a href="#">David Kim</a> commented on <a href="#">your post</a>.</span>
                                    <span class="time">30 minutes ago</span>
                                </div>
                                <div class="media-right">
                                    <div class="added-icon">
                                        <i data-feather="message-square"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- Notification -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/daniel.jpg" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <span><a href="#">Daniel Wellington</a> liked your <a href="#">profile.</a></span>
                                    <span class="time">43 minutes ago</span>
                                </div>
                                <div class="media-right">
                                    <div class="added-icon">
                                        <i data-feather="heart"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- Notification -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/stella.jpg" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <span><a href="#">Stella Bergmann</a> shared a <a href="#">New video</a> on your wall.</span>
                                    <span class="time">Yesterday</span>
                                </div>
                                <div class="media-right">
                                    <div class="added-icon">
                                        <i data-feather="youtube"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- Notification -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/300x300" data-demo-src="assets/img/avatars/elise.jpg" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <span><a href="#">Elise Walker</a> shared an <a href="#">Image</a> with you an 2 other people.</span>
                                    <span class="time">2 days ago</span>
                                </div>
                                <div class="media-right">
                                    <div class="added-icon">
                                        <i data-feather="image"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="nav-drop-footer">
                            <a href="#">View All</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="navbar-item is-icon drop-trigger">
                <a class="icon-link is-active" href="javascript:void(0);">
                    <i data-feather="mail"></i>
                    <span class="indicator"></span>
                </a>

                <div class="nav-drop">
                    <div class="inner">
                        <div class="nav-drop-header">
                            <span>Messages</span>
                            <a href="messages-inbox.html">Inbox</a>
                        </div>
                        <div class="nav-drop-body is-friend-requests">
                            <!-- Message -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/nelly.png" data-user-popover="9" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <a href="#">Nelly Schwartz</a>
                                    <span>I think we should meet near the Starbucks so we can get...</span>
                                    <span class="time">Yesterday</span>
                                </div>
                                <div class="media-right is-centered">
                                    <div class="added-icon">
                                        <i data-feather="message-square"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- Message -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/edward.jpeg" data-user-popover="5" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <a href="#">Edward Mayers</a>
                                    <span>That was a real pleasure seeing you last time we really should...</span>
                                    <span class="time">last week</span>
                                </div>
                                <div class="media-right is-centered">
                                    <div class="added-icon">
                                        <i data-feather="message-square"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- Message -->
                            <div class="media">
                                <figure class="media-left">
                                    <p class="image">
                                        <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/dan.jpg" data-user-popover="1" alt="">
                                    </p>
                                </figure>
                                <div class="media-content">
                                    <a href="#">Dan Walker</a>
                                    <span>Hey there, would it be possible to borrow your bicycle, i really need...</span>
                                    <span class="time">Jun 03 2018</span>
                                </div>
                                <div class="media-right is-centered">
                                    <div class="added-icon">
                                        <i data-feather="message-square"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="nav-drop-footer">
                            <a href="#">Clear All</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mobile-explorer-trigger" class="navbar-item is-icon">
                <a class="icon-link is-primary">
                    <i class="mdi mdi-apps"></i>
                </a>
            </div>

            <div id="open-mobile-search" class="navbar-item is-icon">
                <a class="icon-link is-primary" href="javascript:void(0);">
                    <i data-feather="search"></i>
                </a>
            </div>

            <!-- Mobile menu toggler icon -->
            <div class="navbar-burger">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
        <!-- Navbar mobile menu -->
        <div class="navbar-menu">
            <!-- Account -->
            <div class="navbar-item has-dropdown is-active">
                <a href="/navbar-v1-profile-main.html" class="navbar-link">
                    <img src="https://via.placeholder.com/150x150" data-demo-src="assets/img/avatars/jenna.png" alt="">
                    <span class="is-heading">Jenna Davis</span>
                </a>

                <!-- Mobile Dropdown -->
                <div class="navbar-dropdown">
                    <a href="/navbar-v1-feed.html" class="navbar-item is-flex is-mobile-icon">
                        <span><i data-feather="activity"></i>Feed</span>
                        <span class="menu-badge">87</span>
                    </a>
                    <a href="/navbar-v1-videos-home-v2.html" class="navbar-item is-flex is-mobile-icon">
                        <span><i data-feather="play-circle"></i>Watch</span>
                        <span class="menu-badge">21</span>
                    </a>
                    <a href="/navbar-v1-profile-friends.html" class="navbar-item is-flex is-mobile-icon">
                        <span><i data-feather="heart"></i>Friend Requests</span>
                        <span class="menu-badge">3</span>
                    </a>
                    <a href="/navbar-v1-profile-main.html" class="navbar-item is-flex is-mobile-icon">
                        <span><i data-feather="user"></i>Profile</span>
                    </a>
                    <a href="/navbar-v1-ecommerce-cart.html" class="navbar-item is-flex is-mobile-icon">
                        <span><i data-feather="shopping-cart"></i>Cart</span>
                        <span class="menu-badge">3</span>
                    </a>
                    <a href="#" class="navbar-item is-flex is-mobile-icon">
                        <span><i data-feather="bookmark"></i>Bookmarks</span>
                    </a>
                </div>
            </div>

            <!-- More -->
            <div class="navbar-item has-dropdown">
                <a href="/navbar-v1-settings.html" class="navbar-link">
                    <i data-feather="user"></i>
                    <span class="is-heading">Account</span>
                </a>

                <!-- Mobile Dropdown -->
                <div class="navbar-dropdown">
                    <a href="#" class="navbar-item is-flex is-mobile-icon">
                        <span><i data-feather="life-buoy"></i>Support</span>
                    </a>
                    <a href="/navbar-v1-settings.html" class="navbar-item is-flex is-mobile-icon">
                        <span><i data-feather="settings"></i>Settings</span>
                    </a>
                    <a href="#" class="navbar-item is-flex is-mobile-icon">
                        <span><i data-feather="log-out"></i>Logout</span>
                    </a>
                </div>
            </div>
        </div>
        <!--Search-->
        <div class="mobile-search is-hidden">
            <div class="control">
                <input id="tipue_drop_input_mobile" class="input" placeholder="Search...">
                <div class="form-icon">
                    <i data-feather="search"></i>
                </div>
                <div class="close-icon">
                    <i data-feather="x"></i>
                </div>
                <div id="tipue_drop_content_mobile" class="tipue-drop-content"></div>
            </div>
        </div>
    </nav>