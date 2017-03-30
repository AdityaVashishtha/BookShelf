package com.bookshelf.data;

import com.bookshelf.data.Book;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-03-29T16:20:32")
@StaticMetamodel(BookInfo.class)
public class BookInfo_ { 

    public static volatile SingularAttribute<BookInfo, String> thumbnail;
    public static volatile SingularAttribute<BookInfo, Integer> pagecount;
    public static volatile SingularAttribute<BookInfo, String> author;
    public static volatile SingularAttribute<BookInfo, String> isbn;
    public static volatile SingularAttribute<BookInfo, Float> rating;
    public static volatile SingularAttribute<BookInfo, String> publisher;
    public static volatile SingularAttribute<BookInfo, String> description;
    public static volatile SingularAttribute<BookInfo, String> publishdate;
    public static volatile SingularAttribute<BookInfo, String> title;
    public static volatile CollectionAttribute<BookInfo, Book> bookCollection;

}