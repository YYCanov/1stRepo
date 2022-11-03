#1st comment in main branch
#2nd  comment in main branch
#!/bin/bash
# validAlphaNum – проверяет, содержит ли строка только
# алфавитные и цифровые символы
validAlphaNum()
{
# Проверка аргумента: возвращает 0, если все символы в строке являются
# буквами верхнего/нижнего регистра или цифрами; иначе возвращает 1
# Удалить все недопустимые символы.
validchars="$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

if [ "$validchars" = "$1" ] ; then
        return 0
else
        return 1
fi
}

# НАЧАЛО ОСНОВНОГО СЦЕНАРИЯ -- УДАЛИТЕ ИЛИ ЗАКОММЕНТИРУЙТЕ ВСЕ, ЧТО НИЖЕ,
# ЧТОБЫ ЭТОТ СЦЕНАРИЙ МОЖНО БЫЛО ПОДКЛЮЧАТЬ К ДРУГИМ СЦЕНАРИЯМ.
# =================
/bin/echo -n "Enter input: "
read input

#There is need put an empty input checking
while [[ "$input" == "" ]]; do
        /bin/echo -n "Please enter something: "
        read input
done

# Проверка ввода
if ! validAlphaNum "$input" ; then
        echo "Please enter only letters and numbers." >&2
        exit 1
else
        echo "Input is valid."
fi
exit 0
