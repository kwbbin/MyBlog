package kwbbin.blog.handlers;

import kwbbin.blog.bean.Message;
import kwbbin.blog.bean.Section;
import kwbbin.blog.bean.Zone;
import kwbbin.blog.service.IBackgroundService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class BackgroundController {
    @Autowired
    IBackgroundService service;

    private static final ObjectMapper objectMapper = new ObjectMapper();
    private PrintWriter writer = null;

    public void setService(IBackgroundService service) {
        this.service = service;
    }

    //    跳转到后台主页面
    @RequestMapping(value = "/manage.do")
    public ModelAndView getIndex(ModelAndView mv) {
        mv.setViewName("WEB-INF/background/index.jsp");
        return mv;
    }

    @RequestMapping(value = "/addArticle.do")
    @ResponseBody
    public void addArticle(ModelAndView mv) {

    }


    //    得到所有section
    @RequestMapping(value = "/searchSection.do")
    @ResponseBody
    public List<Section> getSection(ModelAndView mv) {
        return service.getAllSection();
    }

    //    得到一个section
    @RequestMapping(value = "/getSingleSection.do")
    @ResponseBody
    public Section getSection(Integer sid, ModelAndView mv) {
        Section section = service.getSingleSection(sid);
        return section;
    }

    //    得到section的所有zoneId
    @RequestMapping(value = "/getSectionZone.do")
    @ResponseBody
    public List<Zone> getSectionZoneId(ModelAndView mv) {
        return service.getSectionZone();
    }

    // section添加
    @RequestMapping(value = "/addSection.do")
    public void addSection(HttpServletRequest request, HttpServletResponse response, String title, Integer zoneId, @RequestParam MultipartFile img) throws IOException {
        PrintWriter out = response.getWriter();
        if (null == service.getSectionByTitle(title)) {
            String logo = null;
            if (img != null && !img.isEmpty()) {
                //上传后的地址，注意("/upload")是表示文件上传后的目标文件夹
                String realPath = request.getServletContext().getRealPath(File.separator + "uploadImges");
                //获取文件名
                String filename = img.getOriginalFilename();
                //获取文件后缀名
                String extensionname = filename.substring(filename.lastIndexOf(".") + 1);
                //给上传的文件起别名，有很多种方式
                logo = String.valueOf(System.currentTimeMillis()) + "." + extensionname;
                //创建File对象，传入目标路径参数，和新的文件别名
                File dir = new File(realPath, logo);
                if (!dir.exists()) {//如果dir代表的文件不存在，则创建它，
                    dir.mkdirs();//
                }
                //如果存在则直接执行下面操作
                img.transferTo(dir);//将上传的实体文件复制到指定目录uploadImges下
                logo = "uploadImges" + File.separator + logo;
            } else {
                logo = null;
            }

            //将文件名赋值给实体类，然后一并存到数据库
            Section section = new Section(title, zoneId, logo);

            service.addSection(section);
            out.write("success");
//            return "{msg:'success'}";
        } else {
            out.write("has");
//            return "{msg:'success'}";
        }
    }


    //section修改
    @RequestMapping("/SectionUpdate.do")
    public void SectionUpdate(HttpServletRequest request, HttpServletResponse response, String file_change, Integer id, String title, Integer zoneId, @RequestParam MultipartFile img) throws IOException {
        PrintWriter out = response.getWriter();
        Section s = service.getSectionById(id);

        if (null != s) {
            String logo = null;
            if (img != null && !img.isEmpty()) {
                //上传后的地址，注意("/upload")是表示文件上传后的目标文件夹
                String realPath = request.getServletContext().getRealPath(File.separator + "uploadImges");
                //获取文件名
                String filename = img.getOriginalFilename();
                //获取文件后缀名
                String extensionname = filename.substring(filename.lastIndexOf(".") + 1);
                //给上传的文件起别名，有很多种方式
                logo = String.valueOf(System.currentTimeMillis()) + "." + extensionname;
                //创建File对象，传入目标路径参数，和新的文件别名
                File dir = new File(realPath, logo);
                if (!dir.exists()) {//如果dir代表的文件不存在，则创建它，
                    dir.mkdirs();//
                }
                //如果存在则直接执行下面操作
                img.transferTo(dir);//将上传的实体文件复制到指定目录uploadImges下
                logo = "uploadImges" + File.separator + logo;
            } else if ("on".equals(file_change)) {
                logo = s.getLogo();
            } else {
                logo = null;
            }
//            System.out.println(file_change);
            //将文件名赋值给实体类，然后一并存到数据库
            Section section = new Section(id, title, zoneId, logo);
//            System.out.println(section);
            service.updateSection(section);
            out.write("success");

        } else {
            out.write("null");
        }
    }

    @RequestMapping("/deleteSection.do")
    @ResponseBody
    public String deleteSection(Integer id) {
        if (service.getSectionById(id) == null) {
            return "null";
        } else {
            service.deleteSection(id);
            if (service.getSectionById(id) == null) {
                return "success";
            } else {
                return "sb";
            }

        }

    }


    //*****************************    message    ************************************
    //    得到所有message
    @RequestMapping(value = "/searchMessage.do")
    @ResponseBody
    public List<Message> getMessages(ModelAndView mv) {
        return service.getAllMessage();
    }

    //    得到一个message
    @RequestMapping(value = "/getSingleMessage.do")
    @ResponseBody
    public Message getMessage(Integer id, ModelAndView mv) {
        Message message = service.getSingleMessage(id);
        return message;
    }


    @RequestMapping("/deleteMessage.do")
    @ResponseBody
    public String deleteMessageById(Integer id) {
        if (service.getSingleMessage(id) == null) {
            return "null";
        } else {
            service.deleteMessage(id);
            if (service.getSingleMessage(id) == null) {
                return "success";
            } else {
                return "sb";
            }

        }

    }


    @RequestMapping("/MessageUpdate.do")//未完成
    @ResponseBody
    public String updateMessage(Integer id,String content,String responseTime,Integer userId,Integer good,Integer answerToMessage,Integer answerToUser) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
        Date date=sdf.parse(responseTime);
        Message message=new Message(id,content,date,userId,good,answerToMessage,answerToUser);

        if (service.getSingleMessage(id) == null) {
            return "null";
        } else {
            try {
                service.updateMessageById(message);
                return "success";
            }catch(Exception e){
                return "修改失败，请检查用户是否存在";
            }



        }

    }




}