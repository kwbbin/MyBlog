package kwbbin.blog.service;

import kwbbin.blog.bean.Article;

import java.util.List;

public interface IStudyService {
    public List<Article> getStudyArticle(int currPage, int pageSize);
    public int getStudyPageNum(double pageSize);
}
