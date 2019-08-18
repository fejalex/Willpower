/*Подключаю все нужные библиотеки для программы*/
using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.IO;

/*Оглашаю пространство имён программы*/
namespace Willpower
{
    /*Оглашаю класс для формы*/
    public partial class MainForm : Form
    {
        /*Создаю переменные и присваиваю им значения*/
        DateTime onStart = DateTime.Now; // Эта переменная нужна для сохранения времени при запуске секундомера
        public string currentSlot = "Default"; // Эта переменная нужна для запоминания текущего слота сохранения
        public string savepath = @"Saves/Default.txt"; // Эта переменная нужна для определения пути сохранения файлов
        public bool readyToLoad = false; // Эта переменная нужна для того что бы проверять, готова ли программа загрузить данные (для отсутствия багов)

        /*Создание списков*/
        public List<string> delay = new List<string>(); // Это список отрезков времени
        public List<string> saveSlots = new List<string>(); // Это список слотов сохранения

        /*События, которые происходят при загрузке формы*/
        public MainForm()
        {
            InitializeComponent(); // Просто нужно
            if(saveSlots.Count < 1) saveSlots.Add("Default"); // Добавляю стандартный слот сохранения если нету других
            SaveslotChooser.DataSource = saveSlots; // Подгружаю выбор слотов сохранения из списка
            SaveslotChooser.SelectedIndex = 0; // Устанавливаю первый слот сохранения
            currentSlot = SaveslotChooser.Text; // Запоминаю текущий слот сохранения
            StartstopBtn.Select(); // Устанавливаю фокус на кнопку (нужно для визуального оформления)
            if (delay.Count < 1) delay.Add(""); // Создаёт слот для первого отрезка времени если его нет
            savepath = @"Saveslist.txt"; // Задаю путь к файлу, который нужно прочесть
            using (StreamReader sr = new StreamReader(savepath, System.Text.Encoding.Default)) // Запускаю чтение из файла, в котором хранятся все существующие слоты сохранения
            {
                saveSlots.Clear(); // Очищаю список слотов сохранения
                int maxI = Convert.ToInt32(sr.ReadLine()); // Задаю максимальное значение для итератора цикла (количество существующих слотов сохранения)
                for (Int32 i = 0; i < maxI; i++) // Цикл для считывания названий слотов сохранения
                {
                    saveSlots.Add(Convert.ToString(sr.ReadLine())); // Считываю названия слотов сохранения
                }
            }
            savepath = @"Saves/" + currentSlot + ".txt"; // Задаю путь сохранения/загрузки соответственно текущему слоту
            readyToLoad = true; // Говорю программе что теперь можно загружать информацию из слота
            SaveslotChooser.DataSource = null; // Обнуляю визуальный список слотов сохранения
            SaveslotChooser.DataSource = saveSlots; // Заполняю его элементами из виртуального списка
        }

        /*Создание своих функций*/
        public void ResetData() // Эта функция нужна что бы обновить данные в визуальном списке отрезков времени
        {
            delay.Reverse(); // Переворачиваю список отрезков времени для того, что бы они шли в порядке от последнего (текущего) до первого
            DelayList.DataSource = null; // Обнуляю визуальный список отрезков времени
            DelayList.DataSource = delay; // Заполняю его элементами из виртуального списка
            delay.Reverse(); // Обратно переворачиваю виртуальный список для того, что бы предыдущий переворот можно было повторять сколько угодно раз
        }
        public void loadData() // Эта функция нужна что бы загрузить данные слота сохранения из файла
        {
            bool timerStarted; // Создаю переменную, которая определяет, запущен ли таймер из слота сохранения
            currentSlot = SaveslotChooser.Text; // Запоминаю текущий слот сохранения
            savepath = @"Saves/" + currentSlot + ".txt"; // Задаю путь сохранения/загрузки соответственно текущему слоту
            delay.Clear(); // Обнуляю виртуальный список отрезков времени
            Stopwatch.Stop(); // Останавливаю секундомер
            using (StreamReader sr = new StreamReader(savepath, System.Text.Encoding.Default)) // Запускаю чтение из файла, в котором хранятся данные слота сохранения
            {
                if (sr.ReadLine() == "Yes") // Проверяю, запущен ли секундомер в слоте сохранения
                {
                    timerStarted = true; // Запоминаю, что таймер в слоте сохранения запущен
                    StartstopBtn.Text = "Stop"; // Меняю текст кнопки
                    StartstopBtn.ForeColor = System.Drawing.Color.Red; // Меняю цвет кнопки
                    onStart = Convert.ToDateTime(sr.ReadLine()); // Считываю время, когда таймер в слоте сохранения был запущен
                }
                else
                {
                    timerStarted = false; // Запоминаю, что таймер в слоте сохранения не запущен
                    StartstopBtn.Text = "Start"; // Меняю текст кнопки
                    StartstopBtn.ForeColor = System.Drawing.Color.Lime; // Меняю цвет кнопки
                }
                int maxI = Convert.ToInt32(sr.ReadLine()); // Задаю максимальное значение для итератора цикла (количество существующих отрезков времени в слоте сохранения)
                for (Int32 i = 0; i < maxI; i++) // Цикл для считывания существующих отрезков времени в слоте сохранения
                {
                    delay.Add(Convert.ToString(sr.ReadLine())); // Считываю отрезки времени
                }
            }
            if (timerStarted) Stopwatch.Start(); // Если в слоте сохранения был запущен таймер - активирую его в программе
        }
        public void newSlot() // Эта функция нужна для создания нвоого слота сохранения
        {
            readyToLoad = false; // Временно запрещаю программе загружать данные из слотов сохранения
            StartstopBtn.Text = "Start"; // Меняю текст кнопки
            StartstopBtn.ForeColor = System.Drawing.Color.Lime; // Меняю цвет кнопки
            Stopwatch.Stop(); // Останавливаю секундомер
            delay.Clear(); // Обнуляю виртуальный список отрезков времени
            delay.Add(""); // Создаёт слот для первого отрезка времени
            saveSlots.Add(NewslotTextbox.Text); // Добавляю новый слот сохранения в список. Названием выступает ввод пользователя в текстовое поле
            SaveslotChooser.DataSource = null; // Обнуляю визуальный список слотов сохранения
            SaveslotChooser.DataSource = saveSlots; // Заполняю его элементами из виртуального списка
            SaveslotChooser.SelectedIndex = saveSlots.Count - 1; // Выбираю только что созданный слот сохранения как текущий
            currentSlot = SaveslotChooser.Text; // Запоминаю текущий слот сохранения
            NewslotTextbox.Text = ""; // Очищаю текстовое поле для создания новых слотов
            StartstopBtn.Select(); // Устанавливаю фокус на кнопку (нужно для визуального оформления)
            saveData(); // Сохраняю информацию
        }
        public void saveData() //Функция для сохранения состояния программы
        {
            savepath = @"Saves/" + currentSlot + ".txt"; // Задаю путь сохранения/загрузки соответственно текущему слоту
            using (StreamWriter sw = new StreamWriter(savepath, false, System.Text.Encoding.Default)) // Запускаю запись в файл, в котором будут хранится данные слота сохранения
            {
                if (StartstopBtn.Text == "Start") sw.WriteLine("No"); // Проверяю, запущен ли таймер и если нет, записываю это в файл сохранения
                else
                {
                    sw.WriteLine("Yes"); // Записываю в файл сохранения что таймер запущен если это так
                    sw.WriteLine(onStart); // Записываю когда таймер был запущен
                }
                sw.WriteLine(delay.Count); //Записываю в файл сохранения количество существующих отрезков времени
                for (int i = 0; i < delay.Count; i++) // Запускаю цикл для считывания отрезков времени
                {
                    sw.WriteLine(delay[i]); // Считываю отрезов времени
                }
            }
            savepath = @"Saveslist.txt"; // Задаю путь записи для файла списка слотов сохранения
            using (StreamWriter sw = new StreamWriter(savepath, false, System.Text.Encoding.Default)) // Запускаю запись в файл, в котором будет хранится список слотов сохранения
            {
                sw.WriteLine(saveSlots.Count); // Записываю количество слотов сохранения
                for (int i = 0; i < saveSlots.Count; i++) // Запускаю цикл записи слотов сохранения
                {
                    sw.WriteLine(saveSlots[i]); // Записываю название слота сохранения
                }
            }
            savepath = @"Saves/" + currentSlot + ".txt"; // Задаю путь сохранения/загрузки соответственно текущему слоту
            readyToLoad = true; // Говорю программе что теперь можно загружать информацию из слота
        }
        public void deleteSlot () // Функция для удаления слота сохранения
        {
            if (saveSlots.Count > 1) // Проверяю, больше ли слотов сохранения чем один
            {
                readyToLoad = false; // Временно запрещаю программе загружать данные из слотов сохранения
                int index = SaveslotChooser.SelectedIndex; // Создаю переменную index, которой присваиваю значение выбранного сейчас слота сохранения
                SaveslotChooser.DataSource = null; // Обнуляю визуальный список слотов сохранения
                saveSlots.RemoveAt(index); // Удаляю выбранный слот сохранения
                savepath = @"Saveslist.txt"; // Задаю путь записи для файла списка слотов сохранения
                using (StreamWriter sw = new StreamWriter(savepath, false, System.Text.Encoding.Default)) // Запускаю запись в файл, в котором будет хранится список слотов сохранения
                {
                    sw.WriteLine(saveSlots.Count); // Записываю количество слотов сохранения
                    for (int i = 0; i < saveSlots.Count; i++) // Запускаю цикл записи слотов сохранения
                    {
                        sw.WriteLine(saveSlots[i]); // Записываю название слота сохранения
                    }
                }
                savepath = @"Saves/" + currentSlot + ".txt"; // Задаю путь сохранения/загрузки соответственно текущему слоту
                File.Delete(savepath); // Удаляю файл текущего слота сохранения
                readyToLoad = true; // Говорю программе что теперь можно загружать информацию из слота
                SaveslotChooser.DataSource = saveSlots; // Заполняю визуальный список слотов сохранения элементами из виртуального списка
                SaveslotChooser.SelectedIndex = index - 1; // Выбираю Предыдущий перед удалённым слот сохраенния
                loadData(); //Загружаю данные из слотов сохранения
                ResetData(); // Вызываю функцию обновления списка отрезков времени
            }
        }

        /*Функция, которая срабатывает ежесекундно*/
        private void Stopwatch_Tick(object sender, EventArgs e)
        {
            delay[delay.Count - 1] = ((DateTime.Now - onStart).Days.ToString() + "d "
            + (DateTime.Now - onStart).Hours.ToString() + "h " 
            + (DateTime.Now - onStart).Minutes.ToString() + "m " 
            + (DateTime.Now - onStart).Seconds.ToString() + "s"); // Заполняю слот списка отрезков времени разницой между текущим временем и временем запуска секундомера
            ResetData(); // Вызываю функцию обновления списка отрезков времени
            saveData(); // Сохраняю информацию
        }

        /* События на взаимодействие с UI */
        private void StartstopBtn_Click(object sender, EventArgs e) // Событие на нажатие кнопки запуска/остановки таймера
        {
            if (StartstopBtn.Text == "Start") // Проверка, которая узнаёт, запущен ли сейчас таймер даже без лишней переменной ;)
            {
                StartstopBtn.Text = "Stop"; // Меняю текст кнопки
                StartstopBtn.ForeColor = System.Drawing.Color.Red; // Меняю цвет кнопки
                onStart = DateTime.Now; // Запоминаю время запуска
                Stopwatch.Start(); // Запускаю секундомер
            }
            else
            {
                StartstopBtn.Text = "Start"; // Меняю текст кнопки
                StartstopBtn.ForeColor = System.Drawing.Color.Lime; // Меняю цвет кнопки
                Stopwatch.Stop(); // Отсанавливаю секундомер
                delay.Add(""); // Создаю слот в списке для следующего запуска секундомера
                saveData(); // Сохраняю информацию
            }
        }

        private void SaveslotChooser_SelectedIndexChanged(object sender, EventArgs e) // Событие на выбор слота сохранения
        {
            if(readyToLoad)loadData(); //Загружаю данные из слотов сохранения если это возможно
            ResetData(); // Вызываю функцию обновления списка отрезков времени
        }

        private void NewslotBtn_Click(object sender, EventArgs e) // Событие на нажатие кнопки создания нового слота сохранения
        {
            newSlot(); // Выполняю фунцию создания нового слота сохранения
        }

        private void DeleteslotBtn_Click(object sender, EventArgs e) // Событие на нажатие кнопки удаления слота сохранения
        {
            deleteSlot(); // Выполняю фунцию удаления слота сохранения
        }
    }
}
