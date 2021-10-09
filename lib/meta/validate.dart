/*
 * @Description: 需要被验证
 * @Author: iamsmiling
 * @Date: 2021-08-30 22:49:47
 * @LastEditTime: 2021-08-31 09:14:49
 */
part of meta;

class Validate {
  final String message;
  const Validate(this.message);
}

const validate = Validate("the field must be validated");
