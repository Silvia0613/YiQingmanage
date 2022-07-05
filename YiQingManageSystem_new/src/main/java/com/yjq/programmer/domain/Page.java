package com.yjq.programmer.domain;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 分页基本信息
 */
@Component
public class Page {

    private Integer page = 1; //当前页码

    private Integer rows = 5; //每页显示数量

    private Integer offset; //对应数据库中的偏移量

    private Integer totalPage;  //总页数

    private Integer totalCount;  //总记录数

    private String searchContent; // 搜索内容

    private String searchType; // 搜索方式

    protected List<T> list; // 搜索数据

    public Page(){

    }

    public Page(Integer page, Integer rows) {
        this.page = page;
        this.rows = rows;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getOffset() {
        this.offset = (page - 1) * rows;
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getTotalPage() {
        return (totalCount-1)/rows+1;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public String getSearchContent() {
        return searchContent;
    }

    public void setSearchContent(String searchContent) {
        this.searchContent = searchContent;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
