package com.icg.erp;

import org.springframework.web.multipart.MultipartFile;

/**
 * Archivo, File Entity
 *
 * @author John Castillo
 */
public class Archivo {

    private Long id;
    private MultipartFile file;
    private String name;
    private String key;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
