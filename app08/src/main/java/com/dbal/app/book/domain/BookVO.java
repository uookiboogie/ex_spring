package com.dbal.app.book.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BookVO {
  private String bookNo;
  private String bookName;
  private String bookCoverimg;
  private Date bookDate;
  private Long bookPrice;
  private String bookPublisher;
  private String bookInfo;
}
