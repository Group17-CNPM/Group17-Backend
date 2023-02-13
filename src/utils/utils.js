

class Utils{
    static getUTCDateFromString(str, gmt = +7){ // return UTC date from string with gmt
        let t = new Date(String(str));
        let date = new Date(
            Date.UTC(
                t.getFullYear(), t.getMonth(), t.getDate(), 
                t.getHours() - gmt, t.getMinutes(), t.getSeconds()
            )
        );
        return date;
    }
	static getStringFromUTCDate(date, gmt = +7){ // return string date in gmt from UTC date
        if (date == null) return "1970-1-1 0:0:0";
        return `${date.getUTCFullYear()}-`  + 
            `${date.getUTCMonth() + 1}-`    +
            `${date.getUTCDate()} `         +
            `${date.getUTCHours() + gmt}:`  +
            `${date.getUTCMinutes()}:`      +
            `${date.getUTCSeconds()}`;
    }
    
    static getSQLValue(value) {
        if (value == null) return "null";
        value = String(value);
        value = value.replace('\'', '');
        value = value.replace('\"', '');
        return `'${value}'`;
    }
    static getEquation(key, value, acceptNull = false){
        if (value == null) {
            if (acceptNull){
                return ` (${key} = null) `;
            } 
            return "";
        }
        value = String(value);
        value = value.replace('\'', '');
        value = value.replace('\"', '');
        return ` (${key} = '${value}') `;
    }
    static getSearchEquation(key, value, acceptNull = false) {
        if (value == null) {
            if (acceptNull){
                return ` (${key} = null) `;
            } 
            return "";
        }
        value = String(value);
        value = value.replace('\'', '');
        value = value.replace('\"', '');
        return ` (INSTR(${key}, '${value}') > 0 OR INSTR('${value}', ${key}) > 0 OR ${key} = '${value}') `;
    }

    static checkDate(date) {
        if (date == null) return false;
        let dateRegex = /^\d{4}\-([1-9]|0[1-9]|1[012])\-([1-9]|0[1-9]|[12][0-9]|3[01])(\s([0-9]|[01][0-9]|2[0-4]):([0-9]|[0-5][0-9]):([0-9]|[0-5][0-9]))*$/;
        return dateRegex.test(date);
    }
    static checkNumber(number) {
        if (number == null) return false;
        let numberRegex = /^[0-9]{1,}$/;
        return numberRegex.test(String(number));
    }
    static checkUsername(username){
        let usernameRegex = /^[a-zA-Z0-9]{5,30}$/;
        return usernameRegex.test(username);
    }
    static checkPassword(password){
        let passwordRegex = /^[a-zA-Z0-9!@#$%^&*_]{5,30}$/;
        return passwordRegex.test(password);
    }
    static checkEmail(email){
        let emailRegex = /([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
        return emailRegex.test(email);
    }
    static checkRole(role){
        // role: 1 là Ban quản lý, 2 là Kế toán
        role = String(role);
        return role == "1" || role == "2";
    }
    static isNullOrEmpty(value){
        if (value == null) return true;
        if (value == "") return true;
        return false;
    }
    static isExistNullOrEmpty(...params){
        for (let value of params){
            if (Utils.isExistNullOrEmpty(value)){
                return true;
            }
        }
        return false;
    }

    static random(min, max){
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }
}


module.exports = { Utils };

