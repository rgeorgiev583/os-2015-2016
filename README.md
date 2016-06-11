# Задачи

## Bash

**Забележка:** Където съм писал "*всички файлове в дадена директория*", съм имал предвид, че при това се включват и поддиректориите ѝ.  Например ако имаме следната йерархия:

	/foo (dir)
    /foo/bar (dir)
    /foo/bar/quux
    /foo/bar/fuzz
    /foo/baz
    /foo/fizz (dir)
    /foo/fizz/lol (dir)
    /foo/fizz/lol/wut
    /foo/buzz (dir)

Тук под "*всички файлове*" да се разбира следното множество: {`/foo/bar/quux`, `/foo/bar/fuzz`, `/foo/baz`, `/foo/fizz/lol/wut`}.

**Забележка 2**: В синтаксисите на командните редове `[ OPT ]` означава, че *OPT* е нещо, което не е задължително да присъства (може да го има, но може и да го няма), например опция.

**Забележка 3**: Ако има `ARG...` в команден ред, то това означава, че *ARG* може да се среща произволен брой пъти (нула или повече).  Това е стандартното поведение на позиционните аргументи на стандартните *Unix* инструменти.  Съответно вашата имплементация трябва да работи по същия начин.

**Забележка 4**: Можете да вземете аргументите от i-тия аргумент до j-тия с `${@:i:j}`, а от i-тия натам &ndash; с `${@:i}`.

### 1. Напишете *Bash* скрипт, който:

1. Извежда дължините на всички файлове с дадено разширение в дадена директория, като разширението и директорията се подават като аргументи на командния ред.  
   **Бонус:** Ако е подадена опция `-s`, да се изведе сумарната им дължина.  
   **Синтаксис:** `len [ -s ] EXT DIR...`  
   **Пример:** `len .log /var/log`, `len -s .txt /tmp /home/sid`  

2. Убива всички процеси, създадени от потребителите, подадени като аргументи на командния ред.  
   **Бонус:** Ако е подадена опция `-n NAME`, да се убият само тези от гореспоменатите процеси, които са с име на командата *NAME*.  
   **Синтаксис:** `ukill [ -n NAME ] USER...`  
   **Пример:** `ukill sid`, `ukill -n bash sid root`  
   **Забележка:** Името на потребителя е първата колонка на `ps aux`, а PID е втората.  

3. Извежда дължините и имената на n-те най-малки файла за дадена директория, като числото и директорията се подават като аргументи на командния ред.  
   **Бонус:** Ако е подадена опция `-l`, да се изведат само дължините на файловете.  
   **Синтаксис:** `min [ -l ] COUNT DIR...`  
   **Пример:** `min 5 /home/sid`, `min -l 10 /tmp /home/sid`  
   **Забележка:** Командата `sort` приема опция `-n`, която означава да се третират подадените данни на всеки ред на стандартния вход като числа (т.е. не низове) при сортиране (т.е. прави го нелексикографско).  

4. Приема като аргумент(и) файлове (или чете от стандартния вход, ако не са подадени аргументи), на всеки ред от които има пътища, и извежда всички имена на файлове за съответните пътища на стандартния изход.  По даден път трябва да се извежда само името на файла без разширенията (ако има такива).  Т.е. ако файлът има няколко разширения (например `.tar.gz`), всички те трябва да бъдат премахнати.  Например `/var/log/kern.log` по това правило ще се преобразува в `kern`, а `/var/log/Xorg.0.log` &ndash; в `Xorg`.  
   **Синтаксис:** `stripext`, `stripext FILE...`  

### 2. Напишете Bash скрипт, който по подадени две имена на директории като аргументи за всеки файл от първата проверява дали съществува файл във втората директория с разширение `.gz`.  Ако такъв файл не съществува или е по-стар от файла от първата директория, скриптът създава (или съответно замества) компресирано копие на файла от първата във втората директория.  Всички поддиректории от първата директория трябва да бъдат създадени във втората (т.е. да се пресъздаде структурата на директорията).

**Синтаксис:** `backup SRC_DIR DEST_DIR`  
**Пример:** `backup /var/log /tmp/logs`  
**Забележка:** Опцията `-d` на `test` (`[ ]`) командата (т.е. `[ -d FILE ]`) проверява дали *FILE* е директория.  
**Забележка 2:** За да вземете датата на последна промяна във формат на Unix епоха (*Unix time*, т.е. брой изминали секунди след 00:00 часа на 01.01.1970 г.), използвайте `stat -c %Y FILE`.  Тъй като по този начин ще получите две числа, оттук нататък е лесно да ги сравните.  
**Забележка 3:** За компресия може да използвате командата `gzip -c FILE...` (`-c` е опция, която казва на `gzip` да извежда резултата от компресията на стандартния изход).  

## C

*Изберете си които и да са две от четирите задачи.*

**Забележка:** В случая под *конкурентност* се има предвид всеки файл трябва да се обработва в отделен процес (т.е. файловете се обработват в произволен ред и независимо един от друг).

### 1. Да се напише имплементация на `tr`.

`tr` е програма, която прочита текст от стандартния вход знак по знак и замества всяко срещане на знак от първата поредица със съответстващия му знак от втората.  Резултатът се извежда на стандартния изход.

**Синтаксис на извикване:** `tr SET1 SET2`, където `SET1` и `SET2` са поредици от един и същ брой знаци без интервали между тях.  
**Пример:** `tr abc def` замества всяко появяване на знака `a` с `d`, на `b` с `e` и на `c` с `f`.  
**Бонус:** Да се добави опция `-s`, която указва накрая да се изведе сумарният брой срещания на знаци за всеки знак от първата поредица.  
**Бонус 2:** Да се добави поддръжка за думи вместо символи (с опция `-w`). Тук под *дума* се има предвид проиволна последователност от символи без празни пространства.  
**Бонус 3:** Да се добави опция `-v`, която извежда всички позиции, на които е бил заместен символ, заедно със самия символ и заместващия го такъв.  Например:  

	5 a d
    10 b e
    15 c f

### 2. Да се напише конкурентна имплементация на `wc`

`wc` е програма, която (ако е подадена опция `-c`) извежда броя символи и името на файла (отделени с интервал) за всеки подаден като аргумент файл.

**Синтаксис на извикване:** `wc -c FILE...`  
**Бонус:** Да се добави опция `-s`, която указва накрая да се изведе сумарната дължина на всички файлове.  
**Бонус 2:** Да се направи така, че `wc` да брои думи (опция `-w`).  
**Бонус 3:** Да се направи така, че `wc` да брои редове (опция `-l`).  
**Бонус 4:** Да се направи така, че `wc` да извежда и трите числа (брой символи/думи/редове), ако не е подадена нито една опция (от `-c`/`-w`/`-l`).  

### 3. Да се напише конкурентна имплементация на `grep`, която брои срещания вместо да ги извежда

`cgrep` е програма, която обхожда подадените като аргументи файлове знак по знак и извежда броя срещания на дадения символ във всеки файл (поотделно).

**Синтаксис на извикване:** `cgrep CHAR FILE...`  
**Пример:** Нека `foo` съдържа `a` 5 пъти, а `bar` - 10 пъти. Тогава `cgrep a foo bar` ще изведе следното:  

	5
    10

**Бонус:** Да се добави опция `-s`, която указва накрая да се изведе сумарният брой срещания във всички файлове.  
**Бонус 2:** Да се добави поддръжка за думи вместо символи (с опция `-w`). Тук под *дума* се има предвид проиволна последователност от символи без празни пространства.  

### 4. Да се напише прост команден интерпретатор (a.k.a. *shell*)

Дейността му се състои от следните стъпки, повторени до `EOF` (символ за край на файл):

1. На стандартния изход се извежда `$ `.
2. На стандартния вход се подава команден ред (т.е. извикване на команда), например `cat foo bar baz`.  Командата трябва да е едноредова.
3. След като бъде прочетен командният ред, той трябва да бъде изпълнен в отделен процес, чието завършване интерпретаторът трябва да изчака и след това да изведе кода му на грешка.
4. (**Бонус**) Ако командата бъде завършва с `&`, то тя трябва да се изпълни във `фонов режим`, т.е. интерпретаторът да не блокира и да продължи да изпълнява команди междувременно.  
**Пример:** `du &`  
5. (**Бонус 2**) Да може да се стартират едновременно няколко команди наведнъж по този начин.  
**Пример:** `ls & ps & df &`  
6. (**Бонус 3**) да може да се стартират последователно няколко команди една след друга, използвайки разделителя  `;`:  
**Пример:** `ls; ps; df`  

**Забележка:** Може да ползвате функцията [`strtok`](http://www.cplusplus.com/reference/cstring/strtok/) от заглавния файл `<string.h>`, за да извлечете един по един отделните аргументи от командния ред.
