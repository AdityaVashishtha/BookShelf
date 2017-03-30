package com.bookshelf.data;

import com.bookshelf.data.BookInfo;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-03-29T16:20:32")
@StaticMetamodel(Book.class)
public class Book_ { 

    public static volatile SingularAttribute<Book, BookInfo> isbn;
    public static volatile SingularAttribute<Book, Date> addedOn;
    public static volatile SingularAttribute<Book, String> bookId;

}