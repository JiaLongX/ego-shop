<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <#include "head.ftl"/>
    <script type="text/javascript">
        var timeout = 500;
        var closetimer = 0;
        var ddmenuitem = 0;

        $(document).ready(function () {
            $('.cat_item').mousemove(function () {
                $(this).addClass('cat_item_on');
            });
            $('.cat_item').mouseleave(function () {
                $(this).removeClass('cat_item_on');
            });
            $('#slideshow').imgSlideShow({itemclass: 'i'})
            $("#slide-qg").switchTab({titCell: "dt a", trigger: "mouseover", delayTime: 0});
            $("#s_cart_nums1").hover(function () {
                mcancelclosetime();
                if (ddmenuitem) ddmenuitem.hide();
                ddmenuitem = $(document).find("#s_cartbox");
                ddmenuitem.fadeIn();
            }, function () {
                mclosetime();
            });
            $("#s_cart_nums2").hover(function () {
                mcancelclosetime();
                if (ddmenuitem) ddmenuitem.hide();
                ddmenuitem = $(document).find("#s_cartbox");
                ddmenuitem.fadeIn();
            }, function () {
                mclosetime();
            });
            $("#s_cartbox").hover(function () {
                mcancelclosetime();
            }, function () {
                mclosetime();
            });
            var $cur = 1;
            var $i = 4;
            var $len = $('.hot_list>ul>li').length;
            var $pages = Math.ceil($len / $i);
            var $w = $('.hotp').width() - 66;

            var $showbox = $('.hot_list');

            var $pre = $('div.left_icon');
            var $next = $('div.rgt_icon');

            $pre.click(function () {
                if (!$showbox.is(':animated')) {
                    if ($cur == 1) {
                        $showbox.animate({
                            left: '-=' + $w * ($pages - 1)
                        }, 500);
                        $cur = $pages;
                    } else {
                        $showbox.animate({
                            left: '+=' + $w
                        }, 500);
                        $cur--;
                    }

                }
            });

            $next.click(function () {
                if (!$showbox.is(':animated')) {
                    if ($cur == $pages) {
                        $showbox.animate({
                            left: 0
                        }, 500);
                        $cur = 1;
                    } else {
                        $showbox.animate({
                            left: '-=' + $w
                        }, 500);
                        $cur++;
                    }

                }
            });

        });

        function mclose() {
            if (ddmenuitem) ddmenuitem.hide();
        }

        function mclosetime() {
            closetimer = window.setTimeout(mclose, timeout);
        }

        function mcancelclosetime() {
            if (closetimer) {
                window.clearTimeout(closetimer);
                closetimer = null;
            }
        }
    </script>
</head>

<body>
<div id="doc">
    <div id="s_hdw">

        <#include "commons/welcome.ftl"/>
        <div class="s_hd nav">
            <div id="s_logo"><a href="#"><img src="${ctx}/static/images/logo.png" border="0"/></a></div>
            <div id="s_nav">
                <ul>
                    <li class="first cur"><a href="#">??????</a><span></span></li>
                    <li><a href="#">????????????</a><span></span></li>
                    <li><a href="#">??????</a><span></span></li>
                    <li class="last"><a href="#">??????</a><span></span></li>
                </ul>
            </div>
        </div><!--s_hd end-->

        <div class="mmenu">
            <div class="s_hd">
                <div id="s_search">
                    <form action="" method="post"><input name="" type="text" class="search-input"/>
                        <input name="" type="image" src="${ctx}/static/images/btn_search.jpg"/>
                    </form>
                </div>

                <div id="s_keyword">
                    <ul>
                        <li><strong>???????????????</strong></li>
                        <li><a href="#">?????????</a></li>
                        <li><a href="#">SKII</a></li>
                        <li><a href="#">??????</a></li>
                        <li><a href="#">????????????</a></li>
                        <li><a href="#">glasslock</a></li>
                        <li><a href="#">??????</a></li>
                        <li><a href="#">??????</a></li>
                        <li><a href="#">??????</a></li>
                        <li><a href="#">?????????</a></li>
                    </ul>
                </div>

                <div id="s_cart">
                    <ul>
                        <li class="nums"><a href="" id="s_cart_nums1">???????????? <span>0</span> ???</a> <a href="" class="btn"
                                                                                                   id="s_cart_nums2"></a>
                        </li>
                        <li class="checkout"><a href="#">?????????>></a></li>
                    </ul>
                </div>

                <div id="s_cartbox" class="s_cartbox">??????????????????????????????????????????????????????????????????</div>

                <script type="text/javascript">
                    $(document).ready(function () {
                        $("#s_cats").hoverClass("current");
                    });
                </script>

                <div id="s_cats">
                    <div class="cat_hd"><h3><a href="#">??????????????????</a></h3></div>
                    <div class="cat_bd">
                        <ul>
                            <li class="cat_item">
                                <h4 class="cat_tit"><a href="#" class="cat_tit_link">????????????????????????</a><span
                                            class="s_arrow">></span></h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????/??????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">????????????/??????</a></li>
                                                    <li><a href="#" class="more">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????/ ??????/?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????/????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">???</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">?????????/??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">???/??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">?????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????/???</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd></dd>
                                        </dl>

                                    </div>

                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????? Everwines</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">????????????10.8?????????3</a></li>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">??????????????? ????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </li>
                            <li class="cat_item">
                                <h4 class="cat_tit"><a href="#" class="cat_tit_link">???????????????????????????</a><span class="s_arrow">></span>
                                </h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????/???</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">????????????????????????</a></li>
                                                    <li><a href="#">???????????????/???</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#" class="more">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd></dd>
                                        </dl>

                                    </div>

                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">????????????48???????????????</a></li>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">?????????????????????85???</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                    </div>
                                </div>
                            </li>

                            <li class="cat_item">
                                <h4 class="cat_tit"><a href="#" class="cat_tit_link">???????????????????????????</a><span class="s_arrow">></span>
                                </h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">1?????????</a></li>
                                                    <li><a href="#">2?????????</a></li>
                                                    <li><a href="#">3?????????</a></li>
                                                    <li><a href="#">4?????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">???/???/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????/?????????</a></li>
                                                    <li><a href="#">??????/??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????/??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????/??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">??????/?????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">??????/????????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">????????????/????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd></dd>
                                        </dl>

                                    </div>

                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">????????????100??????15</a></li>
                                                    <li><a href="#">????????????85???</a></li>
                                                    <li><a href="#">???????????????2???1</a></li>
                                                </ul>
                                            </dd>
                                        </dl>

                                    </div>
                                </div>
                            </li>

                            <li class="cat_item">
                                <h4 class="cat_tit"><a href="#" class="cat_tit_link">???????????????????????????</a><span class="s_arrow">></span>
                                </h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????/?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">?????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">????????????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">?????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????/??????/?????????</a></li>
                                                    <li><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????/??????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">???????????????/??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd></dd>
                                        </dl>
                                    </div>
                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">ASD ?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">SIMELO</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">Supor ?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">?????????38????????????</a></li>
                                                    <li><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">????????????????????????</a></li>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </li>
                            <li class="cat_item"><h4 class="cat_tit"><a href="#" class="cat_tit_link">???????????????????????????</a><span
                                            class="s_arrow">></span></h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">???????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">???????????? </a></li>
                                                    <li><a href="#">??????/????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">MP3/MP4</a></li>
                                                    <li><a href="#">???????????? </a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">??????/?????? </a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">MID</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">MP3/MP4??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">??????/????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????/??????</a></li>
                                                    <li><a href="#">?????????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">GPS?????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">HTC</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">Apple ??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </li>
                            <li class="cat_item"><h4 class="cat_tit"><a href="#" class="cat_tit_link">????????????????????????</a><span
                                            class="s_arrow">></span></h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">???????????? </a></li>
                                                    <li><a href="#">?????? </a></li>
                                                    <li><a href="#">?????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">DVD?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????? </a></li>
                                                    <li><a href="#">???????????? </a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????/?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????? </a></li>
                                                    <li><a href="#">???/????????? </a></li>
                                                    <li><a href="#">???????????? </a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??? ??? ???</a></li>
                                                    <li><a href="#">?????????????????? </a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????/??????</a></li>
                                                    <li><a href="#">??????/?????? </a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">TCL</a></li>
                                                    <li><a href="#">Midea??????</a></li>
                                                    <li><a href="#">Supor ?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </li>
                            <li class="cat_item"><h4 class="cat_tit"><a href="#"
                                                                        class="cat_tit_link">??????,??????,????????????</a><span
                                            class="s_arrow">></span></h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">iPad????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">???????????? </a></li>
                                                    <li><a href="#">U???</a></li>
                                                    <li><a href="#">????????????NAS</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????/HUB</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">UPS??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">??????AP</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">3G??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????? </a></li>
                                                    <li><a href="#">???????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">???????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">?????? </a></li>
                                                    <li><a href="#">?????? </a></li>
                                                    <li><a href="#">?????? </a></li>
                                                    <li><a href="#">?????? </a></li>
                                                    <li><a href="#">???????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">??????????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">?????????????????? </a></li>
                                                    <li><a href="#">??????????????? </a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">??????????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">??????????????? </a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">??????/???????????? </a></li>
                                                    <li><a href="#">??????/????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">?????? </a></li>
                                                    <li><a href="#">???????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">?????? </a></li>
                                                    <li><a href="#">?????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                    <li><a href="#">????????? </a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd></dd>
                                        </dl>
                                    </div>
                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">SAMSUNG ??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">ThinkPad</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </li>
                            <li class="cat_item"><h4 class="cat_tit"><a href="#" class="cat_tit_link">???????????????????????????</a><span
                                            class="s_arrow">></span></h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????/?????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">LOVO?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????/?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                    <li><a href="#">?????????/???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????/??????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????/???</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">??????/??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????/??????/??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">???</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd></dd>
                                        </dl>
                                    </div>
                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????????????????Wenger</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">????????????99??????</a></li>
                                                    <li><a href="#">????????????????????????</a></li>
                                                    <li><a href="#">??????????????????EGO</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </li>
                            <li class="cat_item"><h4 class="cat_tit"><a href="#" class="cat_tit_link">?????????????????????</a><span
                                            class="s_arrow">></span></h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">??????/????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd></dd>
                                        </dl>
                                    </div>
                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">LALABABY</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">300?????????1?????????</a></li>
                                                    <li><a href="#">??????????????????????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">?????? ?????? ???????????????</a></li>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </li>
                            <li class="cat_item"><h4 class="cat_tit"><a href="#" class="cat_tit_link">????????????</a><span
                                            class="s_arrow">></span></h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">??????.</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????T???</a></li>
                                                    <li><a href="#">??????Polo???</a></li>
                                                    <li><a href="#">???????????????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">??????.</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????T???</a></li>
                                                    <li><a href="#">??????Polo???</a></li>
                                                    <li><a href="#">???????????????/??????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">???????????? </a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">??????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">nike 360</a></li>
                                                    <li><a href="#">CARTELO?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">PARGO??????</a></li>
                                                    <li><a href="#">OLOMO?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">Tomnrabbit</a></li>
                                                    <li><a href="#">JAMESKING</a></li>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">???????????????????????????</a></li>
                                                    <li><a href="#">??????????????? 2??????</a></li>
                                                    <li><a href="#">??????????????? 69??????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </li>
                            <li class="cat_item"><h4 class="cat_tit"><a href="#" class="cat_tit_link">???????????????????????????</a><span
                                            class="s_arrow">></span></h4>
                                <div class="cat_cont">
                                    <div class="cat_cont_lft">
                                        <dl class="cf">
                                            <dt><a href="#">????????????/ ?????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????/????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                    <li><a href="#">???????????????Y</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">?????????/?????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">B????????????</a></li>
                                                    <li><a href="#">?????????A/D</a></li>
                                                    <li><a href="#">?????????E/C</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">???????????????1</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????/???</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????/??????</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">????????????</a></dt>
                                            <dd>
                                                <ul>
                                                    <li class="first"><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????/?????????/?????????????????????????????????</a></li>
                                                    <li><a href="#">?????????????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????/??????</a></li>
                                                    <li><a href="#">???????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????/?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">?????????Y</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">???/????????????</a></li>
                                                    <li><a href="#">?????????Y</a></li>
                                                    <li><a href="#">????????????Y</a></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl class="cf">
                                            <dt><a href="#">???????????????</a></dt>
                                            <dd></dd>
                                        </dl>
                                    </div>
                                    <div class="cat_cont_rgt">
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">???A</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">????????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                                    <li><a href="#">lumi</a></li>
                                                    <li><a href="#">??????</a></li>
                                                    <li><a href="#">?????????</a></li>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>????????????</dt>
                                            <dd>
                                                <ul>
                                                    <li><a href="#">?????????0??????????????????</a></li>
                                                    <li><a href="#">???????????????????????????</a></li>
                                                    <li><a href="#">??????????????????</a></li>
                                                    <li><a href="#">???????????????3???1</a></li>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <!--<div class="all_cats"><a href="#" class="more">??????????????????</a></div>-->
                    </div>
                </div>
            </div>
        </div><!--mmenu end-->

    </div><!--s_hdw end-->

    <link type="text/css" href="${ctx}/static/css/lr.css" rel="stylesheet"/>

    <div id="s_bdw">
        <div id="s_bd">

            <div class="dl_zc">
                <div class="dl_zc_title">
                    <h2 class="f_l">????????????</h2>
                    <div class="rt_bg f_r"></div>
                </div>
                <div class="dl-con cf" id="entry">
                    <form id="formlogin" method="post" onsubmit="return false;">

                        <div class="form" style="width:600px;">
                            <div class="item">
                                <span class="label">????????????</span>

                                <div class="fl">
                                    <input type="text" id="loginname" name="userName" class="text" tabindex="1"
                                           value="admin"/>
                                    <label id="loginname_succeed" class="blank invisible"></label>
                                    <span class="clear"></span>
                                    <label id="loginname_error"></label>

                                </div>
                            </div>
                            <!--item end-->
                            <div class="item">
                                <span class="label">?????????</span>

                                <div class="fl">
                                    <input type="password" id="loginpwd" name="password" value="123456" class="text" tabindex="2"/>
                                    <label id="loginpwd_succeed" class="blank invisible"></label>

                                    <label><a href="forgot-password.html" class="blue">?????????????</a></label>
                                    <span class="clear"></span>
                                    <label id="loginpwd_error"></label>
                                </div>
                            </div>
                            <!--item end-->
                            <div class="item">
                                <span class="label">&nbsp;</span>
                                <div class="fl">
                                    <input type="checkbox" name="dl" id="jz" value=""/><label for="jz">???????????????</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                                            type="checkbox" name="dl" id="zd" value=""/><label for="zd">????????????</label>
                                </div>
                            </div><!--item end-->
                            <div class="item">
                                <span class="label">&nbsp;</span>
                                <input type="button" onclick="userLogin();" class="btnimg" id="loginsubmit" value="??????"
                                       tabindex="8"/>
                            </div>
                        </div>
                        <!--form end-->
                        <div id="guide">
                            <h5>?????????Ego???????????????</h5>

                            <div class="content">????????????????????????Ego??????????????????????????????????????????????????????????????????</div>
                            <a href="register.php" class="btn-personal">???????????????</a>

                        </div>
                        <!--guide end-->
                        <div class="clear"></div>
                    </form>
                </div><!--regist end-->
            </div> <!--dl_zc end-->

            <script type="text/javascript" src="${ctx}/static/js/Validate.js"></script>
            <script type="text/javascript" src="${ctx}/static/js/Validate.entry.js"></script>

        </div><!--s_bd end-->
    </div><!--s_bdw end-->

    <div id="s_ftw">

        <div class="ft_quicklinks">
            <div class="ftql cf">
                <ul>
                    <li class="ftql_s">
                        <h3>????????????</h3>
                        <ul>
                            <li><a href="">????????????</a></li>
                            <li><a href="">?????????</a></li>
                            <li><a href="">????????????</a></li>
                            <li><a href="">???????????????</a></li>
                            <li><a href="">??????????????????</a></li>
                        </ul>
                    </li>
                    <li class="ftql_s">
                        <h3>????????????</h3>
                        <ul>
                            <li><a href="">????????????</a></li>
                            <li><a href="">???????????????</a></li>
                            <li><a href="">????????????</a></li>
                        </ul>
                    </li>
                    <li class="ftql_s">
                        <h3>????????????</h3>
                        <ul>
                            <li><a href="">????????????</a></li>
                            <li><a href="">????????????</a></li>
                            <li><a href="">???????????????EMS???</a></li>
                            <li><a href="">????????????</a></li>
                        </ul>
                    </li>
                    <li class="ftql_s">
                        <h3>????????????</h3>
                        <ul>
                            <li><a href="">????????????</a></li>
                            <li><a href="">????????????</a></li>
                            <li><a href="">????????????</a></li>
                            <li><a href="">????????????</a></li>
                            <li><a href="">????????????</a></li>
                        </ul>
                    </li>
                    <li class="ftql_s">
                        <h3>??????EGO??????</h3>
                        <ul>
                            <li><a href="">EGO????????????</a></li>
                            <li><a href="">??????</a></li>
                            <li><a href="">????????????</a></li>
                            <li><a href="">????????????</a></li>
                            <li><a href="">??????</a></li>
                        </ul>
                    </li>
                    <li class="ftql_s">
                        <div class="ftql_d">
                            <div class="str">?????????????????????</div>
                            <div class="val"><a href="mailto:service@shunkelong.com">sxt@bjsxt.com</a></div>
                        </div>
                        <div class="ftql_d">
                            <div class="str">?????????????????????</div>
                            <div class="val stel">400-009-1906</div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div id="s_ft">
            <div class="ft_suggest pt100">????????????????????????<a href="#">????????????????????????</a></div>
            <div class="ft_banners1 tac pbt10">
                <ul>
                    <li><a href="#"><img src="${ctx}/static/images/ft_1.gif" border="0"/></a></li>
                    <li><a href="#"><img src="${ctx}/static/images/ft_2.gif" border="0"/></a></li>
                    <li><a href="#"><img src="${ctx}/static/images/ft_3.gif" border="0"/></a></li>
                </ul>
            </div>
            <div class="copyright tac pbt10">???????????? Copyright&copy; EGO?????? All Rights Reserved ????????????</div>
            <div class="ft_banners2 tac">
                <ul>
                    <li><a href="#"><img src="${ctx}/static/images/u255.png" border="0"/></a></li>
                    <li><a href="#"><img src="${ctx}/static/images/u257.png" border="0"/></a></li>
                    <li><a href="#"><img src="${ctx}/static/images/u259.png" border="0"/></a></li>
                    <li><a href="#"><img src="${ctx}/static/images/u261.png" border="0"/></a></li>
                </ul>
            </div>
        </div>

    </div><!--s_ftw end-->
</div>

<input type="hidden" id="redirectUrl" value="${redirectUrl!''}"/>
<script type="text/javascript">
        // ????????????
        function userLogin() {
            $.ajax({
                url: "${ctx}/user/login",
                type: "POST",
                data: $("#formlogin").serialize(),
                dataType: "JSON",
                success: function (result) {
                    if (200 == result.code) {
                        // ?????????????????????url??????????????????url
                        if ($("#redirectUrl").val()) {
                            location.href = $("#redirectUrl").val();
                        }else {
                            location.href = "${ctx}/index";
                        }

                    } else {
                        layer.msg("?????????????????????????????????????????????");
                    }
                },
                error: function () {
                    layer.alert("????????????????????????????????????????????????");
                }
            });
        }
</script>
</body>
</html>
