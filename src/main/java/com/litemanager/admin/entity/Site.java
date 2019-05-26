package com.litemanager.admin.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.litemanager.admin.base.DataEntity;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author wangl
 * @since 2017-12-30
 */
@TableName("sys_site")
public class Site extends DataEntity<Site> {

    private static final long serialVersionUID = 1L;

	private String name;
	private String url;
	private String version;
	private String author;
	@TableField("file_upload_type")
	private String fileUploadType;
	private String logo;
	private String server;
	private String database;
	@TableField("max_upload")
	private Integer maxUpload;
	private String description;





	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getFileUploadType() {
		return fileUploadType;
	}

	public void setFileUploadType(String fileUploadType) {
		this.fileUploadType = fileUploadType;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getServer() {
		return server;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public String getDatabase() {
		return database;
	}

	public void setDatabase(String database) {
		this.database = database;
	}

	public Integer getMaxUpload() {
		return maxUpload;
	}

	public void setMaxUpload(Integer maxUpload) {
		this.maxUpload = maxUpload;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}


	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Site{" +
			", name=" + name +
			", version=" + version +
			", author=" + author +
			", fileUploadType=" + fileUploadType +
			", logo=" + logo +
			", server=" + server +
			", database=" + database +
			", maxUpload=" + maxUpload +
			", description=" + description +
			"}";
	}
}
