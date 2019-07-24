package kwbbin.blog.service;

import kwbbin.blog.bean.Article;

import java.util.List;

public interface IFindArticleService {
	public List<Article> findArticle(int currPage, int pageSize, String condition);
	public int getFindPageNum(double pageSize, String condition);
}
