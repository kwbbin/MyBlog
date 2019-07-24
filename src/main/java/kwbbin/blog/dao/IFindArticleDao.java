package kwbbin.blog.dao;

import kwbbin.blog.bean.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IFindArticleDao {
	public List<Article> FindArticle(@Param("condition") String condition);
	public Integer findArticleNum(@Param("condition") String condition);
}
