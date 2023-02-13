package repository.impl;

import model.Book;
import repository.BaseRepository;
import repository.IBookRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private static final String FINDALL = "select * from book";
    private static final String INSERT_INTO = "insert into book(title, pageSize, author, category) values(?, ?, ?, ?)";
    private final String DELETE_USER = "delete from book where id = ?;";
    private static final String UPDATE_USERS_SQL = "update book set title = ?,pageSize= ?, author =?,category=? where id = ?;";
    private static final String FIND_BY_ID = "select * from book where id=?";

    @Override
    public List<Book> bookList() {
        List<Book> bookList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FINDALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("pageSize");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                Book book1 = new Book(id, title, pageSize, author, category);
                bookList.add(book1);
            }
            resultSet.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return bookList;
    }

    @Override
    public Boolean addBook(Book book) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setInt(2, book.getPageSize());
            preparedStatement.setString(3, book.getAuthor());
            preparedStatement.setString(4, book.getCategory());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteBook(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement ps2 = connection.prepareStatement(DELETE_USER);
            ps2.setInt(1, id);
            ps2.executeUpdate();
            return ps2.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateBook(Book book) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setInt(2, book.getPageSize());
            preparedStatement.setString(3, book.getAuthor());
            preparedStatement.setString(4, book.getCategory());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Book> searchBook(String title) {
        return null;
    }

    @Override
    public Book findBookById(int id) {
        Connection connection = BaseRepository.getConnection();
        Book book = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("pageSize");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                book = new Book(id,title, pageSize, author, category);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return book;
    }
}
