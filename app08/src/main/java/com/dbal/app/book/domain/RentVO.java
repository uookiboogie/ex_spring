package com.dbal.app.book.domain;

import lombok.Data;

@Data
public class RentVO {
  private int bookNo;
  private String bookName;
  
  private long bookSum;
  private int bookCount;
}
