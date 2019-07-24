package kwbbin.blog.service;

import kwbbin.blog.bean.Article;
import kwbbin.blog.dao.IHomePageDao;
import kwbbin.blog.dao.IStudyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudyServiceImpl implements IStudyService {

    @Autowired
    IStudyDao dao;

    @Autowired
    IHomePageDao hpdao;

    public void setDao(IStudyDao dao) {
        this.dao = dao;
    }

    public void setHpdao(IHomePageDao hpdao) {
        this.hpdao = hpdao;
    }


    public List<Article> getStudyArticle(int currPage, int pageSize) {
       List<Article> students = dao.getAllStudyArticle();
        for(Article art:students){
            art.setReplySum(hpdao.getReplyNum(art.getId()));
        }
        //从第几条数据开始
        int firstIndex = (currPage - 1) * pageSize;
        //到第几条数据结束
        int lastIndex = currPage * pageSize;
        int totalArticle=dao.getStudyArticleSum();
        if(lastIndex>=totalArticle){
            lastIndex=totalArticle;
        }
        return students.subList(firstIndex, lastIndex); //直接在list中截取
    }


    public int getStudyPageNum(double pageSize) {
        return (int) Math.ceil(dao.getStudyArticleSum()/pageSize);
    }
}
