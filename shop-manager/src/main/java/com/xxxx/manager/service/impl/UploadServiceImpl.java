package com.xxxx.manager.service.impl;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.xxxx.common.result.FileResult;
import com.xxxx.manager.service.UploadService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 上传服务实现类
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Service
public class UploadServiceImpl implements UploadService {

	@Override
	public FileResult upload(MultipartFile file) throws IOException {
		//获取文件名称
		String originalFilename = file.getOriginalFilename();
		//自定义文件/图片名称
		String format = DateTimeFormatter.ofPattern("yyyy/MM/dd/").format(LocalDateTime.now());
		//拼接文件名称
		String fileName = format+System.currentTimeMillis()+originalFilename.substring(originalFilename.lastIndexOf("."));
		InputStream inputStream = file.getInputStream();
		//构造一个带指定 Region 对象的配置类
		Configuration cfg = new Configuration(Region.region0());
		//...其他参数参考类注释
		UploadManager uploadManager = new UploadManager(cfg);
		//...生成上传凭证，然后准备上传
		String accessKey = "SHGUahED208fJ1IRLy6-05tr6EGSKelBvSXOo9zM";
		String secretKey = "XveoMqzBlTS2Z0BKRfCQ0tTID_ytA78AhJ-6pgrY";
		String bucket = "greatroots";
		//默认不指定key的情况下，以文件内容的hash值作为文件名
		String key = fileName;
		//准备返回的对象
		FileResult fileResult = new FileResult();
		try {
			Auth auth = Auth.create(accessKey, secretKey);
			String upToken = auth.uploadToken(bucket);
			try {
				Response response = uploadManager.put(inputStream,key,upToken,null, null);
				//解析上传成功的结果
				if (response.statusCode==200){
					fileResult.setSuccess("success");
					fileResult.setMessage("上传成功");
					fileResult.setFileUrl("http://qvnuorpn2.hd-bkt.clouddn.com/"+fileName);
					return fileResult;
				}else{
					fileResult.setError("error");
					fileResult.setMessage("上传失败");
					return fileResult;
				}
			} catch (QiniuException ex) {
				Response r = ex.response;
				System.err.println(r.toString());
				try {
					System.err.println(r.bodyString());
				} catch (QiniuException ex2) {
					//ignore
				}
			}
		} catch (Exception ex) {
			//ignore
		}
		return fileResult;
	}
}