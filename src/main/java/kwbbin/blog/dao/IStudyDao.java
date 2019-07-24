package kwbbin.blog.dao;

import kwbbin.blog.bean.Article;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IStudyDao {
    public List<Article> getAllStudyArticle();
    public int getStudyArticleSum();
}
