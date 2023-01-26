from datetime import datetime
from time import ctime, strptime, strftime, time
from os import path, listdir, remove, system


class Utils:
    APP_NAME: str = 'Old files remover v0.02.00'

    @staticmethod
    def print_sep_line() -> None:
        print("".center(50, '='))

    @classmethod
    def print_app_title(cls) -> None:
        system('cls')
        cls.print_sep_line()
        cls.print_head_line(cls.APP_NAME)
        cls.print_sep_line()

    @staticmethod
    def print_head_line(head: str) -> None:
        print(f'{head.strip().capitalize().center(50, "-")}')

    @staticmethod
    def get_time_format(file_ctime: float) -> str:
        return strftime("%Y-%m-%d %H:%M", strptime(ctime(file_ctime)))


class FilesRemover:

    def __init__(self):
        self.__dir = ''
        self.__commit = False
        self.__diff_days = 0

    # region Private

    def __print_info(self):
        Utils.print_head_line('Info')
        print(f'Directory: {self.__dir}')
        print(f'Days ago: {self.__diff_days}')
        print(f'Current date time: {datetime.now().date()}')
        print(f'Is commit: {self.__commit}')

    def __setup(self) -> None:
        min_days, default_days, max_days = 0, 30, 365
        self.__diff_days = default_days

        Utils.print_head_line('Setup')

        self.__dir = input("Set directory: ").strip()
        days = input(f"Set days ago (def value: {default_days}): ").strip()
        simulate = input(f"Set commit (def value: {self.__commit}): ").strip().upper().capitalize()

        if days.isdigit() and min_days < int(days) < max_days:
            self.__diff_days = int(days)

        self.__commit = True if simulate.lower() in ("true", "1", "y") else False

    def __delete_files(self, pth: str = None) -> None:

        if pth is None:
            pth = self.__dir

        if not path.exists(pth):
            print(f'Can not find directory: {pth}!')
            return

        for file in listdir(pth):
            abs_path = f'{pth}/{file}'
            if path.isdir(abs_path):
                self.__delete_files(abs_path)
                continue
            file_ctime = path.getctime(abs_path)
            diff_days = (time() - file_ctime) / (24 * 3600)
            if diff_days < self.__diff_days:
                continue
            ans_str = f"file: {abs_path.strip(self.__dir)} -> Time: {Utils.get_time_format(file_ctime)}"
            if not self.__commit:
                print(f'Find {ans_str}')
            else:
                print(f'Remove {ans_str}')
                remove(abs_path)

    # endregion

    # region Public

    def run(self):
        Utils.print_app_title()
        self.__setup()

        self.__print_info()

        Utils.print_head_line('Clear files')
        self.__delete_files()
        Utils.print_sep_line()

    # endregion


if __name__ == "__main__":
    FilesRemover().run()
