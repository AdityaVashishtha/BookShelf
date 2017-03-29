/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookshelf.data;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author aditya
 */
@Entity
@Table(name = "book_info")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BookInfo.findAll", query = "SELECT b FROM BookInfo b")
    , @NamedQuery(name = "BookInfo.findByIsbn", query = "SELECT b FROM BookInfo b WHERE b.isbn = :isbn")
    , @NamedQuery(name = "BookInfo.findByTitle", query = "SELECT b FROM BookInfo b WHERE b.title = :title")
    , @NamedQuery(name = "BookInfo.findByAuthor", query = "SELECT b FROM BookInfo b WHERE b.author = :author")
    , @NamedQuery(name = "BookInfo.findByPublisher", query = "SELECT b FROM BookInfo b WHERE b.publisher = :publisher")
    , @NamedQuery(name = "BookInfo.findByPagecount", query = "SELECT b FROM BookInfo b WHERE b.pagecount = :pagecount")
    , @NamedQuery(name = "BookInfo.findByThumbnail", query = "SELECT b FROM BookInfo b WHERE b.thumbnail = :thumbnail")
    , @NamedQuery(name = "BookInfo.findByPublishdate", query = "SELECT b FROM BookInfo b WHERE b.publishdate = :publishdate")
    , @NamedQuery(name = "BookInfo.findByRating", query = "SELECT b FROM BookInfo b WHERE b.rating = :rating")})
public class BookInfo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "isbn")
    private String isbn;
    @Basic(optional = false)
    @Column(name = "title")
    private String title;
    @Basic(optional = false)
    @Column(name = "author")
    private String author;
    @Basic(optional = false)
    @Column(name = "publisher")
    private String publisher;
    @Basic(optional = false)
    @Lob
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @Column(name = "pagecount")
    private int pagecount;
    @Basic(optional = false)
    @Column(name = "thumbnail")
    private String thumbnail;
    @Basic(optional = false)
    @Column(name = "publishdate")
    private String publishdate;
    @Basic(optional = false)
    @Column(name = "rating")
    private float rating;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "isbn")
    private Collection<Book> bookCollection;

    public BookInfo() {
    }

    public BookInfo(String isbn) {
        this.isbn = isbn;
    }

    public BookInfo(String isbn, String title, String author, String publisher, String description, int pagecount, String thumbnail, String publishdate, float rating) {
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.description = description;
        this.pagecount = pagecount;
        this.thumbnail = thumbnail;
        this.publishdate = publishdate;
        this.rating = rating;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPagecount() {
        return pagecount;
    }

    public void setPagecount(int pagecount) {
        this.pagecount = pagecount;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(String publishdate) {
        this.publishdate = publishdate;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    @XmlTransient
    public Collection<Book> getBookCollection() {
        return bookCollection;
    }

    public void setBookCollection(Collection<Book> bookCollection) {
        this.bookCollection = bookCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (isbn != null ? isbn.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BookInfo)) {
            return false;
        }
        BookInfo other = (BookInfo) object;
        if ((this.isbn == null && other.isbn != null) || (this.isbn != null && !this.isbn.equals(other.isbn))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.bookshelf.data.BookInfo[ isbn=" + isbn + " ]";
    }
    
}
