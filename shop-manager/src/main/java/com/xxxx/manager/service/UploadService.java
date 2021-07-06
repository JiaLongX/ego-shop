package com.xxxx.manager.service;

import com.xxxx.common.result.FileResult;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

/**
 * 上传服务
 */
public interface UploadService {

	FileResult upload(MultipartFile file) throws IOException;
}