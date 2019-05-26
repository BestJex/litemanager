package com.litemanager.admin.util.quartz.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * Created by wangl on 2018/1/26.
 * todo: 系统定时任务
 */
@Component("systemTask")
public class SystemTask {
    private static Logger logger = LoggerFactory.getLogger(SystemTask.class);

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;


    /**
     * 同步文章点击量
     * @param params
     */
//    public void  synchronizationArticleView(String params){
//        ValueOperations<String, Object> operations=redisTemplate.opsForValue();
//        EntityWrapper<BlogArticle> wrapper = new EntityWrapper<>();
//        wrapper.eq("del_flag",false);
//        List<BlogArticle> list = blogArticleService.selectList(wrapper);
//        for (BlogArticle article : list){
//            String key = "article_click_id_"+article.getId();
//            if(redisTemplate.hasKey(key)){
//                Integer count = (Integer)operations.get(key);
//                if(count > 0){
//                    article.setClick(blogArticleService.getArticleClick(article.getId()));
//                    if(StringUtils.isNotBlank(params)){
//                        article.setUpdateId(Long.valueOf(params));
//                    }
//                    blogArticleService.updateById(article);
//                }
//            }
//        }
//    }

}
