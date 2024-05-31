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


def main():
    experiment_data_processed_path = Path('../experiment_data_processed')
    experiment_data = read_experiments_data(experiment_data_processed_path / '3.2.json')
    print(experiment_data)
    total_times = [data["total"] for data in experiment_data]

    fig, ax = plt.subplots()  # Create a figure containing a single Axes.
    ax.plot(['1%', '3%', '10%', '20%'], total_times, label="Actual Total Time")
    # ax.plot([1, 2, 3, 4], [4, 4, 4, 3], label="2")
    ax.legend()
    plt.show()  # Show the figure.


if __name__ == "__main__":
    main()
