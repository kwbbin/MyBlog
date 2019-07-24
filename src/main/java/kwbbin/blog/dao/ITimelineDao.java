package kwbbin.blog.dao;

import kwbbin.blog.bean.Timeline;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ITimelineDao {
    public List<Timeline> getAllTimeline();
}
