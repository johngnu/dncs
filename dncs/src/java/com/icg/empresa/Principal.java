package com.icg.empresa;

import org.springframework.web.multipart.MultipartFile;

/**
 * Principal, File Entity
 *
 * @author John Castillo
 */
public class Principal {

    private Long id;
    private MultipartFile file;

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

}
