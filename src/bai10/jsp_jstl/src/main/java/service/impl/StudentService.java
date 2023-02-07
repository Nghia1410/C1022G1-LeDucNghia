package service.impl;

import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
    IStudentRepository studentRepository = new StudentRepository();

    @Override
    public List<Student> showList() {
        return studentRepository.showList();
    }
}
