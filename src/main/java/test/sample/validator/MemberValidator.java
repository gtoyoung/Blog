package test.sample.validator;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import test.sample.dao.MemberDao;
import test.sample.entity.Member;

@Component
public class MemberValidator implements Validator {
    @Autowired
    private MemberDao memberRepository;

    @Override
    public boolean supports(Class<?> aClass) {
        return Member.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Member member = (Member) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        if (member.getUsername().length() < 6 || member.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.memberForm.username");
        }
        if (memberRepository.findByUsername(member.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.memberForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (member.getPassword().length() < 8 || member.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.memberForm.password");
        }

        if (!member.getPasswordConfirm().equals(member.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.memberForm.passwordConfirm");
        }
    }
}
