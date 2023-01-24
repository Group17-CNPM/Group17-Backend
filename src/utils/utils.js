

class Utils{
    static timezone = new Date().getTimezoneOffset() / 60;

    static getDateFromString(str, gmt = +7){ // return UTC date from string with gmt
        let date = new Date(String(str));
        date.setHours(date.getHours() + timezone + gmt);
        return date;
    }
	static getStringFromDate(date, gmt = +7){ // return string date in gmt from UTC date
        if (date == null) return "1970-1-1 0:0:0";
        return `${date.getUTCFullYear()}-${date.getUTCMonth() + 1}-${date.getUTCDate()} ${date.getUTCHours() + gmt}:${date.getUTCMinutes()}:${date.getUTCSeconds()}`;
    }
    
    static getSQLValue(value) {
        if (value == null) return "null";
        return `'${value}'`;
    }
    static getEquation(key, value, acceptNull = false){
        if (value == null) {
            if (acceptNull){
                return ` (${key} = null) `;
            } else {
                return "";
            }
        }
        return ` (${key} = '${value}') `;
    }
    static getSearchEquation(key, value, acceptNull = false) {
        // console.log(acceptNull);
        if (value == null) {
            if (acceptNull){
                return ` (${key} = null) `;
            } else {
                return "";
            }
        }
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
}


module.exports = { Utils };

