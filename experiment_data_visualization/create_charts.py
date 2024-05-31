import json
# import numpy as np
from pathlib import Path

import matplotlib.pyplot as plt


def read_experiments_data(json_file: Path):
    # from pprint import pprint

    with open(json_file) as json_data:
        data = json.load(json_data)

    return [
        {
            "startup": query_results["Plan"]["Actual Startup Time"],
            "total": query_results["Plan"]["Actual Total Time"],
            "planning": query_results["Planning Time"],
            "execution": query_results["Execution Time"],
        }
        for query_results in data
    ]


SELECTION_PERCENTS = ["1", "3", "10", "20"]
experiment_data_processed_path = Path("../experiment_data_processed")


def selection_charts():
    experiment_data_gin = read_experiments_data(
        experiment_data_processed_path / "3.1.json"
    )
    total_times_gin = [data["total"] for data in experiment_data_gin]
    execution_times_gin = [data["execution"] for data in experiment_data_gin]

    experiment_data = read_experiments_data(experiment_data_processed_path / "3.2.json")
    total_times = [data["total"] for data in experiment_data]
    execution_times = [data["execution"] for data in experiment_data]

    fig, ax = plt.subplots()  # Create a figure containing a single Axes.
    ax.plot(SELECTION_PERCENTS, total_times_gin, label="Actual Total Time (GIN)")
    ax.plot(SELECTION_PERCENTS, execution_times_gin, label="Execution (GIN)")
    ax.plot(SELECTION_PERCENTS, total_times, label="Actual Total Time")
    ax.plot(SELECTION_PERCENTS, execution_times, label="Execution")
    ax.legend()
    ax.set_xlabel('Селективность, %')
    ax.set_ylabel('Время, мс')
    plt.show()  # Show the figure.


NUMBER_OF_ROWS = ['1.000', '1.000.000']


def number_of_rows_charts():
    experiment_data_gin = read_experiments_data(
        experiment_data_processed_path / "3.3.json"
    )
    total_times_gin = [data["total"] for data in experiment_data_gin]
    execution_times_gin = [data["execution"] for data in experiment_data_gin]

    experiment_data = read_experiments_data(experiment_data_processed_path / "3.4.json")
    total_times = [data["total"] for data in experiment_data]
    execution_times = [data["execution"] for data in experiment_data]

    fig, ax = plt.subplots()  # Create a figure containing a single Axes.
    ax.plot(NUMBER_OF_ROWS, total_times_gin, label="Actual Total Time (GIN)")
    ax.plot(NUMBER_OF_ROWS, execution_times_gin, label="Execution (GIN)")
    ax.plot(NUMBER_OF_ROWS, total_times, label="Actual Total Time")
    ax.plot(NUMBER_OF_ROWS, execution_times, label="Execution")
    ax.legend()
    ax.set_xlabel('Количество записей в таблице')
    ax.set_ylabel('Время, мс')
    ax.set_yscale('log')
    plt.show()  # Show the figure.


def main():
    # selection_charts()
    number_of_rows_charts()


if __name__ == "__main__":
    main()
