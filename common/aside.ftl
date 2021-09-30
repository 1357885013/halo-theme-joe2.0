<#if settings.enable_aside>
  <#import "macro/newest.ftl" as np>

  <aside class="joe_aside">
      <#if settings.show_blogger!true>
        <#include "blogger.ftl">
      </#if>

      <#if settings.enable_notice && settings.site_notice??>
        <section class="joe_aside__item notice">
            <div class="joe_aside__item-title">
                <i class="joe-font joe-icon-speaker"></i>
                <span class="text">公告信息</span>
            </div>
            <div class="joe_aside__item-contain">
              <p class="notice_description">${settings.site_notice!}</p>
            </div>
        </section>
      </#if>

      <#if settings.qrcode_url??>
        <section class="joe_aside__item qrcode">
            <div class="joe_aside__item-title">
                <i class="joe-font joe-icon-qrcode"></i>
                <span class="text">${settings.qrcode_title!'我的二维码'}</span>
            </div>
            <div class="joe_aside__item-contain">
              <img class="qrcode_img lazyload" src="https://cdn.jsdelivr.net/gh/qinhua/halo-theme-joe2.0@master/source/img/lazyload.jpeg" data-src="${settings.qrcode_url!}" alt="二维码"/>
              <#if settings.qrcode_description??><p class="qrcode_description">${settings.qrcode_description!}</p></#if>
            </div>
        </section>
      </#if>

      <#if settings.music_id??>
        <section class="joe_aside__item timelife">
            <div class="joe_aside__item-title">
                <i class="joe-font joe-icon-yinfu"></i>
                <span class="text">我的歌单</span>
            </div>
            <div id="aplayer" class="aplayer" data-id="${settings.music_id}" list-max-height="20px" data-server="netease" data-type="playlist" data-fixed="false" data-listfolded="true" data-order="random"  data-mode="#f3f3f7"></div>
        </section>
      </#if>

      <#if settings.show_newest_post!true>
          <@np.newest/>
      </#if>

      <#if settings.show_lifetime!true>
        <section class="joe_aside__item timelife">
            <div class="joe_aside__item-title">
                <i class="joe-font joe-icon-shalou"></i>
                <span class="text">人生倒计时</span>
            </div>
            <div class="joe_aside__item-contain"></div>
        </section>
      </#if>

      <#if settings.show_newreply!true>
        <section class="joe_aside__item newreply">
            <div class="joe_aside__item-title">
            <i class="joe-font joe-icon-message"></i>
                <span class="text">最新回复</span>
            </div>
            <@commentTag method="latest" top='${settings.newreply_page_size!5}'>
            <ul class="joe_aside__item-contain">
                <#list comments.content as comment>
                    <li class="item">
                        <div class="user">
                            <div class="info">
                                <div class="author">${comment.author!}</div>
                                <span class="date">${comment.createTime?string("yyyy-MM-dd")}</span>
                            </div>
                        </div>
                        <div class="reply">
                            <a class="link" href="${comment.post.fullPath}/#${comment.id}">${comment.content} </a>
                        </div>
                    </li>
                </#list>
            </ul>
            </@commentTag>
        </section>
      </#if>

      <#if settings.show_tag_cloud!true>
        <section class="joe_aside__item tags-cloud">
            <div class="joe_aside__item-title">
                <i class="joe-font joe-icon-tag"></i>
                <span class="text">标签云</span>
            </div>
            <div class="joe_aside__item-contain">
                <@tagTag method="list">
                  <#if tags?size gt 0>
                    <ul class="tags-cloud-list" style="display:none;">
                      <#list tags as tag>
                        <#if tag_index lt settings.tag_number?default(17)?number>
                          <#--  <a href="${tag.fullPath!}" title="${tag.name!}">${tag.name!}</a>  -->
                          <li data-url="${tag.fullPath!}" data-label="${tag.name!}">${tag.name!}</li>
                        </#if>
                      </#list>
                    </ul>
                    <div id="tags-3d"></div>
                  <#else>
                      <div class="empty">暂无标签</div>
                  </#if>   
                  <#if tags?size gt settings.tag_number?default(17)?number>
                    <a href="${blog_url!}/tags" style="color:orange">更多>></a>
                  </#if>
                </@tagTag>
            </div>
        </section>
      </#if>

      <#if settings.ad_address?? && settings.ad_address != '' && settings.ad_image?? && settings.ad_image != ''>    
        <section class="joe_aside__item advert">
          <a class="joe_advert" target="_blank" rel="noopener noreferrer nofollow" href="${settings.ad_address}" title="广告">
              <img class="lazyload" width="100%" src="https://cdn.jsdelivr.net/gh/qinhua/halo-theme-joe2.0@master/source/img/lazyload.jpeg" data-src="${settings.ad_image}" alt="广告"/>
              <span class="icon">广告</span>
          </a>
        </section>
      </#if>
  </aside>
</#if>