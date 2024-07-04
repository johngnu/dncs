package com.icg.erp;

import java.util.Date;

/**
 * CacheObject
 *
 * @since 18-05-2018
 * @author Johns Castillo Valencia email: john.gnu@gmail.com
 */
public class CacheObject {

    private Date date;
    private Object obj;

    public CacheObject(Object obj) {
        this.obj = obj;
        this.date = new Date();
    }

    public CacheObject(Date date, Object obj) {
        this.date = date;
        this.obj = obj;
    }

    public Date getDate() {
        return date;
    }

    public Object getObj() {
        return obj;
    }

    public boolean isTenMinsOld() {
        Date current = new Date();
        System.out.println("mins: " + (current.getTime() - this.date.getTime()));
        if ((current.getTime() - this.date.getTime()) < 600000) {
            return false;
        }
        return true;
    }

}
