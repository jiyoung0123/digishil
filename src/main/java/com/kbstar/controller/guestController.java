package com.kbstar.controller;

import com.kbstar.dto.Guest;
import com.kbstar.service.GuestService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@Slf4j
public class guestController {
    @Autowired
    GuestService guestService;
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Value("${uploadimgdir}")
    String imgdir;

    String dir = "guest/";

    @RequestMapping("/guestInfo")
    public String guestInfo(Model model, String id) throws Exception {
        Guest guest = null;
        guest = guestService.get(id);

        model.addAttribute("guest",guest);
        model.addAttribute("center",dir+"guestInfo");
        return "index";
    }
    @RequestMapping("/guestInfoImpl")
    public String guestInfoImpl(@RequestParam("file") MultipartFile file, Model model, String id,String guestLang, String guestIntro) throws Exception {
        Guest guest = null;
        guest = guestService.get(id);

        String guestImage = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
        log.info("------------------------------------------------------------------" + guestImage);
        guest.setGuestImage(guestImage);
        guest.setGuestLang(guestLang);
        guest.setGuestIntro(guestIntro);
        guestService.modify(guest);
        FileUploadUtil.saveFile(file,imgdir);
        return "redirect:/guestInfo?id="+id;
    }

    @RequestMapping("/guestPwd")
    public String guestPwd(Model model, String id) throws Exception {
        Guest guest = null;
        guest = guestService.get(id);

        model.addAttribute("guest",guest);
        model.addAttribute("center",dir+"guestPwd");
        return "index";
    }

}
