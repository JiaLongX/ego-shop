package com.xxxx.manager.controller;


import com.xxxx.common.result.FileResult;
import com.xxxx.manager.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("fileUpload")
public class UploadController {

    @Resource
    private UploadService uploadService;

    @RequestMapping("/save")
    @ResponseBody
    public FileResult upload(MultipartFile file) throws IOException {
        return uploadService.upload(file);
    }
}
