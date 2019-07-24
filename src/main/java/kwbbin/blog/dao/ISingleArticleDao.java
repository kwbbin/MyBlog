package kwbbin.blog.dao;

import kwbbin.blog.bean.Article;

public interface ISingleArticleDao {
	public Article getArticleById(Integer id);
	public void addReading(Integer id);

}
