#!/bin/bash

# Rename chromosomes from Refseq to "chr" notation
# Assume the genome is in ../genome-human
table=../genome-human/GCF_000001405.26_GRCh38_assembly_report.txt

# Create mapping file (only needs to be done once)
awk '$2 == "assembled-molecule" && $4 == "Chromosome" {print $1" "$11}' $table \
  >mapping_from_nb.txt
awk '$2 == "assembled-molecule" && $4 == "Mitochondrion" {print $1" "$10}' $table \
  >>mapping_from_nb.txt

files=(
  "gnomad.genomes.r4.0.indel.tsv.gz"
  "whole_genome_SNVs.tsv.gz"
)

for file in "${files[@]}"; do
  echo "Processing $file..."

  base_name=$(basename "$file" .tsv.gz)
  output_file="${base_name}_chr.tsv.gz"

  # Process the file
  zcat "$file" | awk 'BEGIN{FS=OFS="\t"}
        /^#/{print; next}
        {gsub(/^/, "chr"); print}' | bgzip >"$output_file"

  # Create tabix index
  tabix -s 1 -b 2 -e 2 "$output_file"

  echo "Completed processing $file -> $output_file"
done
echo "All files processed successfully!"

