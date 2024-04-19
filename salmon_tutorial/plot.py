import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load the data from the quant.sf file
df = pd.read_csv("quants/DRR016125_quant_EM/quant.sf", sep="\t")

# Create box plot using seaborn
plt.figure(figsize=(10, 6))
sns.boxplot(data=df, y="NumReads")
plt.title("Box Plot of NumReads")
plt.ylabel("NumReads")

# Save the plot as an image
plt.savefig("box_plot_NumReads_seaborn.png")

# Show the plot (optional)
# plt.show()
