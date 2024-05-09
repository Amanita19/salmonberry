import os
import argparse
import pyreadr
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt


def display_top_entries(directory, n=5):
    # Iterate over all files in the directory
    for filename in os.listdir(directory):
        if filename.endswith('.rda'):
            filepath = os.path.join(directory, filename)
            print(f"File: {filename}")
            
            # Read the RDA file
            result = pyreadr.read_r(filepath)
            
            # Iterate through the items of the OrderedDict
            for key, value in result.items():
                print(f"Key: {key}")
                
                # Check if the value can be converted to a DataFrame
                if isinstance(value, pd.DataFrame):
                    # Display the top entries
                    print(value.head(n))
                elif hasattr(value, 'head'):
                    # If not a DataFrame, but has head method, try converting to DataFrame
                    try:
                        df = pd.DataFrame(value)
                        print(df.head(n))
                    except Exception as e:
                        print("Error:", e)
                else:
                    print(value)  # Print other types of values
                
                print()
                
def read_rda_file(file_path):
    try:
        result = pyreadr.read_r(file_path)
        for key, value in result.items():
            return value
    except Exception as e:
        print(f"Error reading RDA file '{file_path}': {e}")
        return None
def parse_filename(filename):
    _, n, col, _, quant = filename.split("_")
    return n, col, quant
def get_sim_counts(n, col, target):
    df = read_rda_file(f"{target}/sim_counts_matrix_{n}.rda")
    df = df[f"sample_{col}"]
    df = df.reset_index()
    df = df.rename(columns={'index': 'Name', f'sample_{col}': 'True NumReads'})
    return df
    # print(df)
def get_experiment_counts(filepath):
    df = pd.read_csv(filepath, delimiter='\t')
    return df[['Name', 'NumReads']]
    # print(df)
    # return
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Display top entries of RDA files in a directory.')
    parser.add_argument('-d', '--data', type=str, required=True, help='Path to the directory containing RDA files with quantification estimates')
    parser.add_argument('-t', '--target', type=str, required=True, help='Path to the directory containing RDA files with ground truth')
    parser.add_argument('-n', type=int, default=5, help='Number of entries to display (default: 5)')
    args = parser.parse_args()

    # display_top_entries(args.directory, args.n)

    # for filename in os.listdir(args.target):
    #     print(filename)
    #     if filename.endswith('.rda'):
    #         filepath = os.path.join(args.target, filename)
    #         print(read_rda_file(filepath))
    
    all_sim_df = pd.DataFrame()
    all_exp_df = pd.DataFrame()
    all_df = pd.DataFrame()
    
    first = True
    for subdir in os.listdir(args.data):
        
        n, col, quant = parse_filename(subdir)
        exp_df = get_experiment_counts(f"{args.data}/{subdir}/quant.sf")
        # print(f"{args.data}/{subdir}/quant.sf")
        print(n, col, quant)
        sim_df = get_sim_counts(n, col, args.target)
        exp_df['Name'] = exp_df['Name'].apply(lambda x: x[:-2] if len(x) > 2 else x)
        sim_df['Name'] = sim_df['Name'].apply(lambda x: x[:-2] if len(x) > 2 else x)
        # all_sim_df = pd.concat(all_sim_df, sim_df)
        # all_exp_df = pd.concat(all_exp_df, exp_df)
        
        # print(sim_df)
        # print(exp_df)
        
        df = pd.merge(sim_df, exp_df, on='Name', how='inner')
        
        # all_df = pd.concat([all_df, df])
        print(df)

        # Calculate absolute difference
        # df['Absolute Difference'] = abs(df['True NumReads'] - df['NumReads'])

        # Calculate relative difference
        # df['Relative Difference'] = df['Absolute Difference'] / df['True NumReads']

        # Compute mean absolute relative distance
        # mean_absolute_relative_distance = df['Relative Difference'].mean()

        # print("Mean Absolute Relative Distance:", mean_absolute_relative_distance)
        if first:
            sample_set = df.sample(n=1000)
            df = sample_set
        else:
            df = df[df['Name'].isin(sample_set['Name'])]
        sns.set_theme(style="ticks")

        # Assuming your DataFrame is named df

        # Initialize the figure with a logarithmic x axis
        f, ax = plt.subplots(figsize=(12, 6))
        ax.set_xscale("log")
        ax.set_xlim([1, 1e6])
        # Plot the NumReads and TrueNumReads with horizontal boxes
        sns.boxplot(
            data=df, orient="h", whis=[0, 100], width=.6, palette="vlag"
        )

        # Add in points to show each observation
        sns.stripplot(data=df, orient="h", size=4, color=".3")

        # Tweak the visual presentation
        ax.xaxis.grid(True)
        ax.set(ylabel="")
        plt.xlabel("Number of Reads")

        sns.despine(trim=True, left=True)

        # Save the plot as a PNG file
        plt.savefig(f"n={n}col={col}quant={quant}.png")

        # Close the plot to release resources
        plt.close()
    # print(all_sim_df)