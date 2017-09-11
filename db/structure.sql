--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alignment_metrics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alignment_metrics (
    rg_id integer NOT NULL,
    category character varying(255) NOT NULL,
    num_reads bigint,
    pf_reads bigint,
    pct_pf_reads real,
    pf_noise_reads bigint,
    pf_reads_aligned bigint,
    pct_pf_reads_aligned real,
    pf_aligned_bases bigint,
    pf_hq_aligned_reads bigint,
    pf_hq_aligned_bases bigint,
    pf_hq_aligned_q20_bases bigint,
    pf_hq_median_mismatches bigint,
    pf_mismatch_rate real,
    pf_hq_error_rate real,
    pf_indel_rate real,
    mean_read_length real,
    reads_aligned_in_pairs bigint,
    pct_reads_aligned_in_pairs real,
    bad_cycles integer,
    strand_balance real,
    pct_chimeras real,
    pct_adapter real
);


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: base_biases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE base_biases (
    rg_id integer NOT NULL,
    read_position integer NOT NULL,
    num_a bigint NOT NULL,
    num_c bigint NOT NULL,
    num_g bigint NOT NULL,
    num_t bigint NOT NULL,
    num_n bigint NOT NULL,
    num_x bigint NOT NULL
);


--
-- Name: bed_coverages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bed_coverages (
    rg_id integer NOT NULL,
    bed_id integer NOT NULL,
    depth integer
);


--
-- Name: bed_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bed_groups (
    id integer NOT NULL,
    name character varying(255),
    md5sum character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    genome_id integer
);


--
-- Name: bed_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bed_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bed_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bed_groups_id_seq OWNED BY bed_groups.id;


--
-- Name: bed_regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bed_regions (
    id integer NOT NULL,
    name text,
    chr character varying(255),
    start bigint,
    "end" bigint,
    bed_group_id integer NOT NULL,
    frac_gc double precision,
    folding_energy double precision,
    context character varying,
    motif character varying
);


--
-- Name: bed_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bed_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bed_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bed_regions_id_seq OWNED BY bed_regions.id;


--
-- Name: bedgraph_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bedgraph_files (
    id integer NOT NULL,
    read_group_id integer NOT NULL,
    loaded_file_id integer NOT NULL,
    md5sum character varying NOT NULL,
    path character varying,
    contents bytea
);


--
-- Name: bedgraph_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bedgraph_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bedgraph_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bedgraph_files_id_seq OWNED BY bedgraph_files.id;


--
-- Name: coverage_depths; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE coverage_depths (
    rg_id integer NOT NULL,
    depth integer NOT NULL,
    chromosome character varying(255) NOT NULL,
    num_bases bigint,
    frac_bases double precision,
    id integer NOT NULL
);


--
-- Name: coverage_depths_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE coverage_depths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coverage_depths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE coverage_depths_id_seq OWNED BY coverage_depths.id;


--
-- Name: duplicate_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE duplicate_groups (
    rg_id integer NOT NULL,
    duplication_group integer NOT NULL,
    num_reads bigint NOT NULL
);


--
-- Name: duplicate_reads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE duplicate_reads (
    rg_id integer NOT NULL,
    fold_reads integer NOT NULL,
    fold_unique real NOT NULL
);


--
-- Name: exp_transcript_concentrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE exp_transcript_concentrations (
    id integer NOT NULL,
    transcript_id integer NOT NULL,
    transcript_group_id integer NOT NULL,
    exp_concentration_am_ul double precision
);


--
-- Name: exp_transcript_concentrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exp_transcript_concentrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exp_transcript_concentrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exp_transcript_concentrations_id_seq OWNED BY exp_transcript_concentrations.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE features (
    id integer NOT NULL,
    seqid character varying NOT NULL,
    source character varying NOT NULL,
    feature_type character varying NOT NULL,
    start integer NOT NULL,
    "end" integer NOT NULL,
    strand character varying NOT NULL,
    attr_id character varying NOT NULL,
    length integer,
    exon_number integer,
    loaded_file_id integer,
    CONSTRAINT check_feature_type CHECK (((feature_type)::text = ANY (('{UTR,exon,five_prime_UTR,three_prime_UTR}'::character varying[])::text[]))),
    CONSTRAINT check_strand CHECK (((strand)::text = ANY (('{+,-}'::character varying[])::text[])))
);


--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE features_id_seq OWNED BY features.id;


--
-- Name: features_transcripts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE features_transcripts (
    id integer NOT NULL,
    feature_id integer,
    transcript_id integer
);


--
-- Name: features_transcripts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE features_transcripts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: features_transcripts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE features_transcripts_id_seq OWNED BY features_transcripts.id;


--
-- Name: gc_biases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gc_biases (
    rg_id integer NOT NULL,
    pct_gc integer NOT NULL,
    num_reads bigint NOT NULL,
    num_windows bigint NOT NULL,
    mean_base_quality integer NOT NULL,
    normalized_coverage real NOT NULL,
    error_bar_width real NOT NULL
);


--
-- Name: gc_per_reads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gc_per_reads (
    id integer NOT NULL,
    read_group_id integer NOT NULL,
    gc_pct integer NOT NULL,
    frc_reads double precision NOT NULL
);


--
-- Name: gc_per_reads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gc_per_reads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gc_per_reads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE gc_per_reads_id_seq OWNED BY gc_per_reads.id;


--
-- Name: genes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE genes (
    id integer NOT NULL,
    seqid character varying NOT NULL,
    source character varying NOT NULL,
    start integer NOT NULL,
    "end" integer NOT NULL,
    strand character varying NOT NULL,
    attr_id character varying NOT NULL,
    gene_name character varying,
    loaded_file_id integer,
    CONSTRAINT check_strand CHECK (((strand)::text = ANY (('{+,-}'::character varying[])::text[])))
);


--
-- Name: genes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE genes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE genes_id_seq OWNED BY genes.id;


--
-- Name: genomes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE genomes (
    id integer NOT NULL,
    name character varying NOT NULL,
    size bigint,
    md5sum character varying
);


--
-- Name: genomes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE genomes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE genomes_id_seq OWNED BY genomes.id;


--
-- Name: observed_taxa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE observed_taxa (
    id integer NOT NULL,
    rg_id integer NOT NULL,
    tax_id integer NOT NULL,
    num_reads bigint,
    taxon_class character varying,
    e_value_min double precision,
    e_value_mean double precision,
    e_value_max double precision
);


--
-- Name: read_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE read_groups (
    id integer NOT NULL,
    run_id integer NOT NULL,
    library character varying(255),
    barcode character varying(255) NOT NULL,
    sample character varying(255),
    project character varying(255),
    library_date date,
    library_prep_method character varying(255),
    input_ng real,
    shearing_method character varying(255),
    avg_insert_size integer,
    max_insert_size integer,
    min_insert_size integer,
    genome_size bigint,
    num_reads bigint,
    notes text,
    pcr_cycles integer,
    pcr_annealing_sec integer,
    pcr_annealing_deg integer,
    pcr_extension_sec integer,
    pcr_extension_deg integer,
    start_library_nm real,
    final_library_pm real,
    naoh_stock_date date,
    contact_email character varying(255),
    pcr_yield_ng double precision,
    pcr_conc_nm double precision,
    pcr_volume_ul double precision,
    notebook_location character varying(255),
    pre_denaturation_buffer character varying(255),
    lane character varying(255) DEFAULT 1 NOT NULL,
    gc_stat double precision,
    target_bed_group_id integer,
    num_rrna_reads bigint,
    num_primary_mapped_reads bigint,
    genome_id integer,
    genome character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    product_number character varying,
    lot_number character varying,
    species character varying
);


--
-- Name: taxon_groups_taxon_ids; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE taxon_groups_taxon_ids (
    id integer NOT NULL,
    taxon_group_name character varying NOT NULL,
    tax_id integer NOT NULL
);


--
-- Name: grouped_observed_taxa; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW grouped_observed_taxa AS
 SELECT ot.rg_id,
    tgti.taxon_group_name,
    rg.num_reads AS num_reads_total,
    sum(ot.num_reads) AS num_reads_per_taxon_group
   FROM ((observed_taxa ot
     JOIN read_groups rg ON ((rg.id = ot.rg_id)))
     JOIN taxon_groups_taxon_ids tgti ON ((ot.tax_id = tgti.tax_id)))
  WHERE ((ot.taxon_class)::text = 'total'::text)
  GROUP BY ot.rg_id, tgti.taxon_group_name, rg.num_reads;


--
-- Name: grouped_observed_taxa_details; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW grouped_observed_taxa_details AS
 SELECT got.rg_id,
    got.taxon_group_name,
    got.num_reads_total,
    got.num_reads_per_taxon_group,
    ((1.0 * got.num_reads_per_taxon_group) / (got.num_reads_total)::numeric) AS frc_reads_per_taxon_group
   FROM grouped_observed_taxa got;


--
-- Name: hybrid_selection_metrics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE hybrid_selection_metrics (
    rg_id integer NOT NULL,
    bait_set character varying NOT NULL,
    genome_size bigint NOT NULL,
    bait_territory integer NOT NULL,
    target_territory integer NOT NULL,
    bait_design_efficiency double precision NOT NULL,
    total_reads integer NOT NULL,
    pf_reads integer NOT NULL,
    pf_unique_reads integer NOT NULL,
    pct_pf_reads double precision NOT NULL,
    pct_pf_uq_reads double precision NOT NULL,
    pf_uq_reads_aligned integer NOT NULL,
    pct_pf_uq_reads_aligned double precision NOT NULL,
    pf_uq_bases_aligned integer NOT NULL,
    on_bait_bases integer NOT NULL,
    near_bait_bases integer NOT NULL,
    off_bait_bases integer NOT NULL,
    on_target_bases integer NOT NULL,
    pct_selected_bases double precision NOT NULL,
    pct_off_bait double precision NOT NULL,
    on_bait_vs_selected double precision NOT NULL,
    mean_bait_coverage double precision NOT NULL,
    mean_target_coverage double precision NOT NULL,
    pct_usable_bases_on_bait double precision NOT NULL,
    pct_usable_bases_on_target double precision NOT NULL,
    fold_enrichment double precision NOT NULL,
    zero_cvg_targets_pct double precision NOT NULL,
    fold_80_base_penalty double precision NOT NULL,
    pct_target_bases_2x double precision NOT NULL,
    pct_target_bases_10x double precision NOT NULL,
    pct_target_bases_20x double precision NOT NULL,
    pct_target_bases_30x double precision NOT NULL,
    pct_target_bases_40x double precision,
    pct_target_bases_50x double precision,
    pct_target_bases_100x double precision,
    hs_library_size double precision,
    hs_penalty_10x double precision NOT NULL,
    hs_penalty_20x double precision NOT NULL,
    hs_penalty_30x double precision NOT NULL,
    hs_penalty_40x double precision,
    hs_penalty_50x double precision,
    hs_penalty_100x double precision,
    at_dropout double precision NOT NULL,
    gc_dropout double precision NOT NULL,
    sample character varying,
    library character varying,
    read_group character varying
);


--
-- Name: idx_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE idx_stats (
    id integer NOT NULL,
    rg_id integer NOT NULL,
    sequence_name character varying NOT NULL,
    sequence_length integer NOT NULL,
    num_mapped_reads bigint NOT NULL,
    num_unmapped_reads bigint NOT NULL,
    genome_id integer NOT NULL
);


--
-- Name: idx_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE idx_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: idx_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE idx_stats_id_seq OWNED BY idx_stats.id;


--
-- Name: insert_sizes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE insert_sizes (
    rg_id integer NOT NULL,
    insert_size integer NOT NULL,
    fr_count bigint NOT NULL,
    rf_count bigint
);


--
-- Name: insert_sizes_wo_nulls; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW insert_sizes_wo_nulls AS
 SELECT i.rg_id,
    i.insert_size,
    COALESCE(i.fr_count, (0)::bigint) AS fr_count,
    COALESCE(i.rf_count, (0)::bigint) AS rf_count
   FROM insert_sizes i;


--
-- Name: insert_sizes_details; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW insert_sizes_details AS
 SELECT i.rg_id,
    i.insert_size,
    i.fr_count,
    i.rf_count,
    (i.fr_count + i.rf_count) AS fr_rf_count,
    sum((i.fr_count + i.rf_count)) OVER w AS num_fr_rf,
    ((1.0 * ((i.fr_count + i.rf_count))::numeric) / sum((i.fr_count + i.rf_count)) OVER w) AS frc_fr_rf
   FROM insert_sizes_wo_nulls i
  WINDOW w AS (PARTITION BY i.rg_id);


--
-- Name: library_complexities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE library_complexities (
    rg_id integer NOT NULL,
    unpaired_reads_examined integer NOT NULL,
    read_pairs_examined integer NOT NULL,
    unmapped_reads integer NOT NULL,
    unpaired_read_duplicates integer NOT NULL,
    read_pair_duplicates integer NOT NULL,
    read_pair_optical_duplicates integer NOT NULL,
    percent_duplication double precision NOT NULL,
    estimated_library_size bigint NOT NULL
);


--
-- Name: loaded_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE loaded_files (
    id integer NOT NULL,
    name character varying NOT NULL,
    md5sum character varying NOT NULL,
    file_type character varying,
    header character varying,
    path character varying,
    url character varying,
    genome_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: loaded_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE loaded_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: loaded_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE loaded_files_id_seq OWNED BY loaded_files.id;


--
-- Name: methylation_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE methylation_statuses (
    id integer NOT NULL,
    read_group_id integer NOT NULL,
    bed_region_id integer NOT NULL,
    num_methylated_bases integer NOT NULL,
    num_unmethylated_bases integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    total integer
);


--
-- Name: methylation_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE methylation_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: methylation_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE methylation_statuses_id_seq OWNED BY methylation_statuses.id;


--
-- Name: ncbi_taxa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ncbi_taxa (
    taxon_id integer,
    taxon_name character varying(250),
    domain character varying(250),
    species_taxon_id integer,
    species_taxon_name character varying(250)
);


--
-- Name: observed_contaminating_taxa; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW observed_contaminating_taxa AS
 SELECT ot.id,
    ot.rg_id,
    ot.tax_id,
    ot.num_reads,
    ot.taxon_class,
    ot.e_value_min,
    ot.e_value_mean,
    ot.e_value_max
   FROM observed_taxa ot
  WHERE (NOT (ot.tax_id IN ( SELECT taxon_groups_taxon_ids.tax_id
           FROM taxon_groups_taxon_ids
          WHERE ((taxon_groups_taxon_ids.taxon_group_name)::text = 'non_contaminating'::text))));


--
-- Name: observed_taxa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE observed_taxa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: observed_taxa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE observed_taxa_id_seq OWNED BY observed_taxa.id;


--
-- Name: per_transcript_coverages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE per_transcript_coverages (
    id integer NOT NULL,
    read_group_id integer NOT NULL,
    transcript_id integer NOT NULL,
    bedgraph_file_id integer NOT NULL,
    tot_nof_bins integer NOT NULL,
    bin_idx integer NOT NULL,
    mean_coverage double precision
);


--
-- Name: per_transcript_coverages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE per_transcript_coverages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: per_transcript_coverages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE per_transcript_coverages_id_seq OWNED BY per_transcript_coverages.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE properties (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: ranked_observed_taxa; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW ranked_observed_taxa AS
 SELECT oct.id,
    oct.rg_id,
    oct.tax_id,
    oct.num_reads,
    oct.taxon_class,
    oct.e_value_min,
    oct.e_value_mean,
    oct.e_value_max,
    nt.taxon_id,
    nt.taxon_name,
    nt.domain,
    nt.species_taxon_id,
    nt.species_taxon_name,
    rg.num_reads AS num_reads_total,
    ((1.0 * (oct.num_reads)::numeric) / (rg.num_reads)::numeric) AS frc_reads_on_taxon,
    rank() OVER w_above AS taxon_rank,
    sum(oct.num_reads) OVER w_above AS cum_sum_num_reads_above,
    sum(oct.num_reads) OVER w_below AS cum_sum_num_reads_below
   FROM ((observed_contaminating_taxa oct
     JOIN read_groups rg ON ((oct.rg_id = rg.id)))
     JOIN ncbi_taxa nt ON (((oct.tax_id = nt.taxon_id) AND ((oct.taxon_class)::text = 'total'::text))))
  WINDOW w_above AS (PARTITION BY oct.rg_id ORDER BY oct.num_reads DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), w_below AS (PARTITION BY oct.rg_id ORDER BY oct.num_reads DESC ROWS BETWEEN 1 FOLLOWING AND UNBOUNDED FOLLOWING);


--
-- Name: ranked_observed_taxa_details; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW ranked_observed_taxa_details AS
 SELECT rot.id,
    rot.rg_id,
    rot.tax_id,
    rot.num_reads,
    rot.taxon_class,
    rot.e_value_min,
    rot.e_value_mean,
    rot.e_value_max,
    rot.taxon_id,
    rot.taxon_name,
    rot.domain,
    rot.species_taxon_id,
    rot.species_taxon_name,
    rot.num_reads_total,
    rot.frc_reads_on_taxon,
    rot.taxon_rank,
    rot.cum_sum_num_reads_above,
    rot.cum_sum_num_reads_below,
    ((1.0 * rot.cum_sum_num_reads_above) / (rot.num_reads_total)::numeric) AS cum_sum_frc_reads_above,
    ((1.0 * rot.cum_sum_num_reads_below) / (rot.num_reads_total)::numeric) AS cum_sum_frc_reads_below
   FROM ranked_observed_taxa rot;


--
-- Name: read_group_properties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE read_group_properties (
    id integer NOT NULL,
    property_id integer NOT NULL,
    read_group_id integer NOT NULL,
    raw_value character varying NOT NULL,
    numeric_value double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: read_group_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE read_group_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: read_group_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE read_group_properties_id_seq OWNED BY read_group_properties.id;


--
-- Name: read_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE read_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: read_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE read_groups_id_seq OWNED BY read_groups.id;


--
-- Name: rna_seq_avg_transcript_coverages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rna_seq_avg_transcript_coverages (
    rg_id integer NOT NULL,
    normalized_position integer NOT NULL,
    normalized_coverage double precision NOT NULL
);


--
-- Name: rna_seq_metrics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rna_seq_metrics (
    rg_id integer NOT NULL,
    pf_bases bigint NOT NULL,
    pf_aligned_bases bigint NOT NULL,
    ribosomal_bases bigint NOT NULL,
    coding_bases bigint NOT NULL,
    utr_bases bigint NOT NULL,
    intronic_bases bigint NOT NULL,
    intergenic_bases bigint NOT NULL,
    ignored_reads bigint NOT NULL,
    correct_strand_reads bigint NOT NULL,
    incorrect_strand_reads bigint NOT NULL,
    pct_ribosomal_bases double precision NOT NULL,
    pct_coding_bases double precision NOT NULL,
    pct_utr_bases double precision NOT NULL,
    pct_intronic_bases double precision NOT NULL,
    pct_intergenic_bases double precision NOT NULL,
    pct_mrna_bases double precision NOT NULL,
    pct_usable_bases double precision NOT NULL,
    pct_correct_strand_reads double precision NOT NULL,
    median_cv_coverage double precision NOT NULL,
    median_5prime_bias double precision NOT NULL,
    median_3prime_bias double precision NOT NULL,
    median_5prime_to_3prime_bias double precision NOT NULL
);


--
-- Name: runs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE runs (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    date date,
    instrument character varying(255),
    instrument_type character varying(255),
    read_1_size integer,
    index_read_2_size integer,
    read_3_size integer,
    index_read_4_size integer,
    flow_cell character varying,
    samplesheet_raw text
);


--
-- Name: runs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE runs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: runs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE runs_id_seq OWNED BY runs.id;


--
-- Name: sam_flagstats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sam_flagstats (
    id integer NOT NULL,
    rg_id integer,
    total bigint NOT NULL,
    supplementary bigint NOT NULL,
    secondary bigint NOT NULL,
    duplicate bigint NOT NULL,
    mapped bigint NOT NULL,
    paired_in_sequencing bigint NOT NULL,
    read1 bigint NOT NULL,
    read2 bigint NOT NULL,
    properly_paired bigint NOT NULL,
    both_mates_mapped bigint NOT NULL,
    singletons bigint NOT NULL,
    mate_mapped_to_other_chr bigint NOT NULL,
    mate_highq_mapped_to_other_chr bigint NOT NULL,
    non_pf_total bigint NOT NULL,
    non_pf_supplementary bigint NOT NULL,
    non_pf_secondary bigint NOT NULL,
    non_pf_duplicate bigint NOT NULL,
    non_pf_mapped bigint NOT NULL,
    non_pf_paired_in_sequencing bigint NOT NULL,
    non_pf_read1 bigint NOT NULL,
    non_pf_read2 bigint NOT NULL,
    non_pf_properly_paired bigint NOT NULL,
    non_pf_both_mates_mapped bigint NOT NULL,
    non_pf_singletons bigint NOT NULL,
    non_pf_mate_mapped_to_other_chr bigint NOT NULL,
    non_pf_mate_highq_mapped_to_other_chr bigint NOT NULL,
    created_at time without time zone NOT NULL,
    updated_at time without time zone NOT NULL
);


--
-- Name: sam_flagstats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sam_flagstats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sam_flagstats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sam_flagstats_id_seq OWNED BY sam_flagstats.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: seqprep_trimming_metrics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE seqprep_trimming_metrics (
    id integer NOT NULL,
    read_group_id integer NOT NULL,
    num_pairs_processed integer NOT NULL,
    num_pairs_merged integer NOT NULL,
    num_pairs_w_adapters integer NOT NULL,
    num_pairs_discarded integer NOT NULL,
    frc_pairs_merged double precision NOT NULL,
    frc_pairs_w_adapters double precision NOT NULL,
    frc_pairs_discarded double precision NOT NULL
);


--
-- Name: seqprep_trimming_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seqprep_trimming_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seqprep_trimming_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE seqprep_trimming_metrics_id_seq OWNED BY seqprep_trimming_metrics.id;


--
-- Name: taxon_groups_taxon_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taxon_groups_taxon_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taxon_groups_taxon_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taxon_groups_taxon_ids_id_seq OWNED BY taxon_groups_taxon_ids.id;


--
-- Name: transcript_abundances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE transcript_abundances (
    id integer NOT NULL,
    transcript_id integer NOT NULL,
    read_group_id integer NOT NULL,
    rpkm double precision,
    tpm double precision,
    nof_reads double precision,
    coverage_cv double precision
);


--
-- Name: transcript_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE transcript_groups (
    id integer NOT NULL,
    name character varying NOT NULL,
    md5sum character varying NOT NULL,
    path character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: transcript_abundances_and_concentrations; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW transcript_abundances_and_concentrations AS
 SELECT ta.read_group_id,
    ta.transcript_id,
    ta.tpm,
    etc.exp_concentration_am_ul,
    etc.transcript_group_id,
    tg.name AS transcript_group_name
   FROM ((transcript_abundances ta
     JOIN exp_transcript_concentrations etc ON ((ta.transcript_id = etc.transcript_id)))
     JOIN transcript_groups tg ON ((etc.transcript_group_id = tg.id)));


--
-- Name: transcript_abundance_concentration_correlations; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW transcript_abundance_concentration_correlations AS
 SELECT tac.read_group_id,
    tac.transcript_group_id,
    tac.transcript_group_name,
    corr(tac.tpm, tac.exp_concentration_am_ul) AS tpm_concentration_r_pearson,
    corr((tac.rank1)::double precision, (tac.rank2)::double precision) AS tpm_concentration_rho_spearman
   FROM ( SELECT transcript_abundances_and_concentrations.read_group_id,
            transcript_abundances_and_concentrations.transcript_id,
            transcript_abundances_and_concentrations.tpm,
            transcript_abundances_and_concentrations.exp_concentration_am_ul,
            transcript_abundances_and_concentrations.transcript_group_id,
            transcript_abundances_and_concentrations.transcript_group_name,
            rank() OVER (PARTITION BY transcript_abundances_and_concentrations.read_group_id, transcript_abundances_and_concentrations.transcript_group_id ORDER BY transcript_abundances_and_concentrations.tpm) AS rank1,
            rank() OVER (PARTITION BY transcript_abundances_and_concentrations.read_group_id, transcript_abundances_and_concentrations.transcript_group_id ORDER BY transcript_abundances_and_concentrations.exp_concentration_am_ul) AS rank2
           FROM transcript_abundances_and_concentrations
          ORDER BY transcript_abundances_and_concentrations.read_group_id, transcript_abundances_and_concentrations.transcript_group_id) tac
  GROUP BY tac.read_group_id, tac.transcript_group_id, tac.transcript_group_name;


--
-- Name: transcript_abundances_all_v_all; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW transcript_abundances_all_v_all AS
 SELECT ta1.transcript_id,
    ta1.read_group_id AS read_group_id1,
    ta1.tpm AS tpm1,
    ta2.read_group_id AS read_group_id2,
    ta2.tpm AS tpm2
   FROM transcript_abundances ta1,
    transcript_abundances ta2
  WHERE ((ta1.transcript_id = ta2.transcript_id) AND (ta1.tpm IS NOT NULL) AND (ta2.tpm IS NOT NULL));


--
-- Name: transcript_abundance_correlations_all_v_all; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW transcript_abundance_correlations_all_v_all AS
 SELECT taa2.read_group_id1,
    taa2.read_group_id2,
    corr(taa2.tpm1, taa2.tpm2) AS tpm_r_pearson,
    corr((taa2.rank1)::double precision, (taa2.rank2)::double precision) AS tpm_rho_spearman
   FROM ( SELECT transcript_abundances_all_v_all.transcript_id,
            transcript_abundances_all_v_all.read_group_id1,
            transcript_abundances_all_v_all.tpm1,
            transcript_abundances_all_v_all.read_group_id2,
            transcript_abundances_all_v_all.tpm2,
            rank() OVER (PARTITION BY transcript_abundances_all_v_all.read_group_id1, transcript_abundances_all_v_all.read_group_id2 ORDER BY transcript_abundances_all_v_all.tpm1) AS rank1,
            rank() OVER (PARTITION BY transcript_abundances_all_v_all.read_group_id1, transcript_abundances_all_v_all.read_group_id2 ORDER BY transcript_abundances_all_v_all.tpm2) AS rank2
           FROM transcript_abundances_all_v_all
          ORDER BY transcript_abundances_all_v_all.read_group_id1, transcript_abundances_all_v_all.read_group_id2, transcript_abundances_all_v_all.transcript_id) taa2
  GROUP BY taa2.read_group_id1, taa2.read_group_id2;


--
-- Name: transcript_abundances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transcript_abundances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transcript_abundances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transcript_abundances_id_seq OWNED BY transcript_abundances.id;


--
-- Name: transcripts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE transcripts (
    id integer NOT NULL,
    seqid character varying NOT NULL,
    source character varying NOT NULL,
    start integer NOT NULL,
    "end" integer NOT NULL,
    strand character varying NOT NULL,
    attr_id character varying NOT NULL,
    nof_exons integer,
    length integer,
    gene_id integer,
    loaded_file_id integer,
    pct_gc double precision,
    delta_g double precision,
    delta_g_norm double precision,
    probe_homology character varying,
    CONSTRAINT check_strand CHECK (((strand)::text = ANY (('{+,-}'::character varying[])::text[])))
);


--
-- Name: transcript_annotations; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW transcript_annotations AS
 SELECT t.id,
    t.seqid,
    t.source,
    t.start,
    t."end",
    t.strand,
    t.attr_id,
    t.nof_exons,
    t.length,
    t.gene_id,
    t.loaded_file_id,
    t.pct_gc,
    t.delta_g,
    t.delta_g_norm,
    t.probe_homology,
    etc.exp_concentration_am_ul,
    tg.name AS transcript_groups_name,
    lf.name AS gff_file_name
   FROM transcripts t,
    exp_transcript_concentrations etc,
    transcript_groups tg,
    loaded_files lf
  WHERE ((t.id = etc.transcript_id) AND (tg.id = etc.transcript_group_id) AND (t.loaded_file_id = lf.id));


--
-- Name: transcript_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transcript_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transcript_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transcript_groups_id_seq OWNED BY transcript_groups.id;


--
-- Name: transcripts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transcripts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transcripts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transcripts_id_seq OWNED BY transcripts.id;


--
-- Name: unmapped_rescue_metrics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE unmapped_rescue_metrics (
    id integer NOT NULL,
    read_group_id integer NOT NULL,
    num_total_reads double precision NOT NULL,
    num_end_to_end_mapped_reads double precision NOT NULL,
    frc_end_to_end_mapped_reads double precision NOT NULL,
    num_end_to_end_unmapped_reads double precision NOT NULL,
    frc_end_to_end_unmapped_reads double precision NOT NULL,
    num_local_mapped_reads double precision NOT NULL,
    frc_local_mapped_reads double precision NOT NULL,
    num_local_unmapped_reads double precision NOT NULL,
    frc_local_unmapped_reads double precision NOT NULL,
    num_rescued_clipped_long_reads double precision NOT NULL,
    frc_rescued_clipped_long_reads double precision NOT NULL,
    num_rescued_not_clipped_long_reads double precision NOT NULL,
    frc_rescued_not_clipped_long_reads double precision NOT NULL,
    num_rescued_clipped_long_mapped_overlapping_reads double precision NOT NULL,
    frc_rescued_clipped_long_mapped_overlapping_reads double precision NOT NULL,
    num_rescued_clipped_long_not_mapped_overlapping_reads double precision NOT NULL,
    frc_rescued_clipped_long_not_mapped_overlapping_reads double precision NOT NULL,
    frc_rescued_clipped_long_mapped_overlapping_of_rs_cl_ln_reads double precision NOT NULL
);


--
-- Name: unmapped_rescue_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unmapped_rescue_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unmapped_rescue_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unmapped_rescue_metrics_id_seq OWNED BY unmapped_rescue_metrics.id;


--
-- Name: bed_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bed_groups ALTER COLUMN id SET DEFAULT nextval('bed_groups_id_seq'::regclass);


--
-- Name: bed_regions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bed_regions ALTER COLUMN id SET DEFAULT nextval('bed_regions_id_seq'::regclass);


--
-- Name: bedgraph_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bedgraph_files ALTER COLUMN id SET DEFAULT nextval('bedgraph_files_id_seq'::regclass);


--
-- Name: coverage_depths id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY coverage_depths ALTER COLUMN id SET DEFAULT nextval('coverage_depths_id_seq'::regclass);


--
-- Name: exp_transcript_concentrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY exp_transcript_concentrations ALTER COLUMN id SET DEFAULT nextval('exp_transcript_concentrations_id_seq'::regclass);


--
-- Name: features id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY features ALTER COLUMN id SET DEFAULT nextval('features_id_seq'::regclass);


--
-- Name: features_transcripts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY features_transcripts ALTER COLUMN id SET DEFAULT nextval('features_transcripts_id_seq'::regclass);


--
-- Name: gc_per_reads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY gc_per_reads ALTER COLUMN id SET DEFAULT nextval('gc_per_reads_id_seq'::regclass);


--
-- Name: genes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY genes ALTER COLUMN id SET DEFAULT nextval('genes_id_seq'::regclass);


--
-- Name: genomes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY genomes ALTER COLUMN id SET DEFAULT nextval('genomes_id_seq'::regclass);


--
-- Name: idx_stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY idx_stats ALTER COLUMN id SET DEFAULT nextval('idx_stats_id_seq'::regclass);


--
-- Name: loaded_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY loaded_files ALTER COLUMN id SET DEFAULT nextval('loaded_files_id_seq'::regclass);


--
-- Name: methylation_statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY methylation_statuses ALTER COLUMN id SET DEFAULT nextval('methylation_statuses_id_seq'::regclass);


--
-- Name: observed_taxa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY observed_taxa ALTER COLUMN id SET DEFAULT nextval('observed_taxa_id_seq'::regclass);


--
-- Name: per_transcript_coverages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_transcript_coverages ALTER COLUMN id SET DEFAULT nextval('per_transcript_coverages_id_seq'::regclass);


--
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: read_group_properties id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY read_group_properties ALTER COLUMN id SET DEFAULT nextval('read_group_properties_id_seq'::regclass);


--
-- Name: read_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY read_groups ALTER COLUMN id SET DEFAULT nextval('read_groups_id_seq'::regclass);


--
-- Name: runs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY runs ALTER COLUMN id SET DEFAULT nextval('runs_id_seq'::regclass);


--
-- Name: sam_flagstats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sam_flagstats ALTER COLUMN id SET DEFAULT nextval('sam_flagstats_id_seq'::regclass);


--
-- Name: seqprep_trimming_metrics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY seqprep_trimming_metrics ALTER COLUMN id SET DEFAULT nextval('seqprep_trimming_metrics_id_seq'::regclass);


--
-- Name: taxon_groups_taxon_ids id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taxon_groups_taxon_ids ALTER COLUMN id SET DEFAULT nextval('taxon_groups_taxon_ids_id_seq'::regclass);


--
-- Name: transcript_abundances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transcript_abundances ALTER COLUMN id SET DEFAULT nextval('transcript_abundances_id_seq'::regclass);


--
-- Name: transcript_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transcript_groups ALTER COLUMN id SET DEFAULT nextval('transcript_groups_id_seq'::regclass);


--
-- Name: transcripts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transcripts ALTER COLUMN id SET DEFAULT nextval('transcripts_id_seq'::regclass);


--
-- Name: unmapped_rescue_metrics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unmapped_rescue_metrics ALTER COLUMN id SET DEFAULT nextval('unmapped_rescue_metrics_id_seq'::regclass);


--
-- Name: alignment_metrics alignment_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alignment_metrics
    ADD CONSTRAINT alignment_metrics_pkey PRIMARY KEY (rg_id, category);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: base_biases base_biases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY base_biases
    ADD CONSTRAINT base_biases_pkey PRIMARY KEY (rg_id, read_position);


--
-- Name: bed_coverages bed_coverages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bed_coverages
    ADD CONSTRAINT bed_coverages_pkey PRIMARY KEY (rg_id, bed_id);


--
-- Name: bed_groups bed_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bed_groups
    ADD CONSTRAINT bed_groups_pkey PRIMARY KEY (id);


--
-- Name: bed_regions bed_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bed_regions
    ADD CONSTRAINT bed_regions_pkey PRIMARY KEY (id);


--
-- Name: bedgraph_files bedgraph_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bedgraph_files
    ADD CONSTRAINT bedgraph_files_pkey PRIMARY KEY (id);


--
-- Name: coverage_depths coverage_depth_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coverage_depths
    ADD CONSTRAINT coverage_depth_pk UNIQUE (id);


--
-- Name: duplicate_reads duplicate_reads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY duplicate_reads
    ADD CONSTRAINT duplicate_reads_pkey PRIMARY KEY (rg_id, fold_reads);


--
-- Name: exp_transcript_concentrations exp_transcript_concentrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exp_transcript_concentrations
    ADD CONSTRAINT exp_transcript_concentrations_pkey PRIMARY KEY (id);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: features_transcripts features_transcripts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY features_transcripts
    ADD CONSTRAINT features_transcripts_pkey PRIMARY KEY (id);


--
-- Name: gc_biases gc_biases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gc_biases
    ADD CONSTRAINT gc_biases_pkey PRIMARY KEY (rg_id, pct_gc);


--
-- Name: gc_per_reads gc_per_reads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gc_per_reads
    ADD CONSTRAINT gc_per_reads_pkey PRIMARY KEY (id);


--
-- Name: genes genes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY genes
    ADD CONSTRAINT genes_pkey PRIMARY KEY (id);


--
-- Name: genomes genomes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY genomes
    ADD CONSTRAINT genomes_pkey PRIMARY KEY (id);


--
-- Name: idx_stats idx_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY idx_stats
    ADD CONSTRAINT idx_stats_pkey PRIMARY KEY (id);


--
-- Name: insert_sizes insert_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY insert_sizes
    ADD CONSTRAINT insert_sizes_pkey PRIMARY KEY (rg_id, insert_size);


--
-- Name: loaded_files loaded_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY loaded_files
    ADD CONSTRAINT loaded_files_pkey PRIMARY KEY (id);


--
-- Name: methylation_statuses methylation_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY methylation_statuses
    ADD CONSTRAINT methylation_statuses_pkey PRIMARY KEY (id);


--
-- Name: observed_taxa observed_taxa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observed_taxa
    ADD CONSTRAINT observed_taxa_pkey PRIMARY KEY (id);


--
-- Name: per_transcript_coverages per_transcript_coverages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_transcript_coverages
    ADD CONSTRAINT per_transcript_coverages_pkey PRIMARY KEY (id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: read_group_properties read_group_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY read_group_properties
    ADD CONSTRAINT read_group_properties_pkey PRIMARY KEY (id);


--
-- Name: read_groups read_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY read_groups
    ADD CONSTRAINT read_groups_pkey PRIMARY KEY (id);


--
-- Name: runs runs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY runs
    ADD CONSTRAINT runs_pkey PRIMARY KEY (id);


--
-- Name: sam_flagstats sam_flagstats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sam_flagstats
    ADD CONSTRAINT sam_flagstats_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);

-- Name: seqprep_trimming_metrics seqprep_trimming_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY seqprep_trimming_metrics
    ADD CONSTRAINT seqprep_trimming_metrics_pkey PRIMARY KEY (id);


--
-- Name: taxon_groups_taxon_ids taxon_groups_taxon_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taxon_groups_taxon_ids
    ADD CONSTRAINT taxon_groups_taxon_ids_pkey PRIMARY KEY (id);


--
-- Name: transcript_abundances transcript_abundances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transcript_abundances
    ADD CONSTRAINT transcript_abundances_pkey PRIMARY KEY (id);


--
-- Name: transcript_groups transcript_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transcript_groups
    ADD CONSTRAINT transcript_groups_pkey PRIMARY KEY (id);


--
-- Name: transcripts transcripts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transcripts
    ADD CONSTRAINT transcripts_pkey PRIMARY KEY (id);


--
-- Name: unmapped_rescue_metrics unmapped_rescue_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unmapped_rescue_metrics
    ADD CONSTRAINT unmapped_rescue_metrics_pkey PRIMARY KEY (id);


--
-- Name: in_alignment_metrics_rg_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX in_alignment_metrics_rg_id ON alignment_metrics USING btree (rg_id);

ALTER TABLE alignment_metrics CLUSTER ON in_alignment_metrics_rg_id;


--
-- Name: in_base_biases_rg_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX in_base_biases_rg_id ON base_biases USING btree (rg_id);

ALTER TABLE base_biases CLUSTER ON in_base_biases_rg_id;


--
-- Name: in_bed_cov_rg_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX in_bed_cov_rg_id ON bed_coverages USING btree (rg_id);

ALTER TABLE bed_coverages CLUSTER ON in_bed_cov_rg_id;


--
-- Name: in_cov_depth_rg_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX in_cov_depth_rg_id ON coverage_depths USING btree (rg_id);

ALTER TABLE coverage_depths CLUSTER ON in_cov_depth_rg_id;


--
-- Name: in_meth_status_bed_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX in_meth_status_bed_id ON methylation_statuses USING btree (bed_region_id);


--
-- Name: in_meth_status_rgid_brid_cov; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX in_meth_status_rgid_brid_cov ON methylation_statuses USING btree (read_group_id, bed_region_id, total);


--
-- Name: in_rg_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX in_rg_id ON insert_sizes USING btree (rg_id);

ALTER TABLE insert_sizes CLUSTER ON in_rg_id;


--
-- Name: index_bed_coverages_on_bed_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bed_coverages_on_bed_id ON bed_coverages USING btree (bed_id);


--
-- Name: index_bed_groups_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bed_groups_name ON bed_groups USING btree (name);


--
-- Name: index_bed_groups_on_genome_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bed_groups_on_genome_id ON bed_groups USING btree (genome_id);


--
-- Name: index_bed_groups_on_md5sum; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_bed_groups_on_md5sum ON bed_groups USING btree (md5sum);


--
-- Name: index_bed_regions_bed_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bed_regions_bed_group_id ON bed_regions USING btree (bed_group_id);


--
-- Name: index_bed_regions_folding_energy; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bed_regions_folding_energy ON bed_regions USING btree (folding_energy);


--
-- Name: index_bed_regions_gc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bed_regions_gc ON bed_regions USING btree (frac_gc);


--
-- Name: index_bed_regions_on_bed_group_id_and_chr; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bed_regions_on_bed_group_id_and_chr ON bed_regions USING btree (bed_group_id, chr);


--
-- Name: index_bedgraph_files_on_loaded_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bedgraph_files_on_loaded_file_id ON bedgraph_files USING btree (loaded_file_id);


--
-- Name: index_bedgraph_files_on_read_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bedgraph_files_on_read_group_id ON bedgraph_files USING btree (read_group_id);


--
-- Name: index_exp_transcript_concentrations_on_transcript_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exp_transcript_concentrations_on_transcript_group_id ON exp_transcript_concentrations USING btree (transcript_group_id);


--
-- Name: index_exp_transcript_concentrations_on_transcript_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exp_transcript_concentrations_on_transcript_id ON exp_transcript_concentrations USING btree (transcript_id);


--
-- Name: index_features_on_loaded_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_features_on_loaded_file_id ON features USING btree (loaded_file_id);


--
-- Name: index_features_transcripts_on_feature_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_features_transcripts_on_feature_id ON features_transcripts USING btree (feature_id);


--
-- Name: index_features_transcripts_on_transcript_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_features_transcripts_on_transcript_id ON features_transcripts USING btree (transcript_id);


--
-- Name: index_gc_per_reads_on_read_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gc_per_reads_on_read_group_id ON gc_per_reads USING btree (read_group_id);


--
-- Name: index_genes_on_loaded_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_genes_on_loaded_file_id ON genes USING btree (loaded_file_id);


--
-- Name: index_genomes_on_md5sum; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_genomes_on_md5sum ON genomes USING btree (md5sum);


--
-- Name: index_genomes_on_name_and_size; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_genomes_on_name_and_size ON genomes USING btree (name, size);


--
-- Name: index_hybrid_selection_metrics_on_rg_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hybrid_selection_metrics_on_rg_id ON hybrid_selection_metrics USING btree (rg_id);


--
-- Name: index_idx_stats_on_rg_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_idx_stats_on_rg_id ON idx_stats USING btree (rg_id);


--
-- Name: index_loaded_files_on_genome_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_loaded_files_on_genome_id ON loaded_files USING btree (genome_id);


--
-- Name: index_methylation_statuses_on_read_group_id_and_bed_region_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_methylation_statuses_on_read_group_id_and_bed_region_id ON methylation_statuses USING btree (read_group_id, bed_region_id);


--
-- Name: index_observed_taxa_on_rg_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_observed_taxa_on_rg_id ON observed_taxa USING btree (rg_id);


--
-- Name: index_per_transcript_coverages_on_bedgraph_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_per_transcript_coverages_on_bedgraph_file_id ON per_transcript_coverages USING btree (bedgraph_file_id);


--
-- Name: index_per_transcript_coverages_on_read_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_per_transcript_coverages_on_read_group_id ON per_transcript_coverages USING btree (read_group_id);


--
-- Name: index_per_transcript_coverages_on_transcript_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_per_transcript_coverages_on_transcript_id ON per_transcript_coverages USING btree (transcript_id);


--
-- Name: index_read_group_properties_on_property_id_and_read_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_read_group_properties_on_property_id_and_read_group_id ON read_group_properties USING btree (property_id, read_group_id);


--
-- Name: index_read_groups_library; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_read_groups_library ON read_groups USING btree (library);


--
-- Name: index_read_groups_on_genome_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_read_groups_on_genome_id ON read_groups USING btree (genome_id);


--
-- Name: index_read_groups_project; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_read_groups_project ON read_groups USING btree (project);


--
-- Name: index_rna_seq_avg_transcript_coverages_on_rg_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rna_seq_avg_transcript_coverages_on_rg_id ON rna_seq_avg_transcript_coverages USING btree (rg_id);


--
-- Name: index_rna_seq_metrics_on_rg_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rna_seq_metrics_on_rg_id ON rna_seq_metrics USING btree (rg_id);


--
-- Name: index_seqprep_trimming_metrics_on_read_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_seqprep_trimming_metrics_on_read_group_id ON seqprep_trimming_metrics USING btree (read_group_id);


--
-- Name: index_taxon_groups_taxon_ids_on_tax_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taxon_groups_taxon_ids_on_tax_id ON taxon_groups_taxon_ids USING btree (tax_id);


--
-- Name: index_transcript_abundances_on_read_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcript_abundances_on_read_group_id ON transcript_abundances USING btree (read_group_id);


--
-- Name: index_transcript_abundances_on_transcript_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcript_abundances_on_transcript_id ON transcript_abundances USING btree (transcript_id);


--
-- Name: index_transcripts_on_gene_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcripts_on_gene_id ON transcripts USING btree (gene_id);


--
-- Name: index_transcripts_on_loaded_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transcripts_on_loaded_file_id ON transcripts USING btree (loaded_file_id);


--
-- Name: index_unmapped_rescue_metrics_on_read_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_unmapped_rescue_metrics_on_read_group_id ON unmapped_rescue_metrics USING btree (read_group_id);


--
-- Name: uniq_feature_pos; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_feature_pos ON features USING btree (loaded_file_id, seqid, feature_type, start, "end", strand);


--
-- Name: uniq_taxon_group_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_taxon_group_taxon_id ON taxon_groups_taxon_ids USING btree (taxon_group_name, tax_id);


--
-- Name: uniq_transcript_attr_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_transcript_attr_id ON transcripts USING btree (loaded_file_id, attr_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: alignment_metrics fk_alignment_metrics_read_groups_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alignment_metrics
    ADD CONSTRAINT fk_alignment_metrics_read_groups_1 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: base_biases fk_base_biases_read_groups_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY base_biases
    ADD CONSTRAINT fk_base_biases_read_groups_1 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: bed_coverages fk_bed_coverages_bed_regions_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bed_coverages
    ADD CONSTRAINT fk_bed_coverages_bed_regions_1 FOREIGN KEY (bed_id) REFERENCES bed_regions(id);


--
-- Name: bed_coverages fk_bed_coverages_read_groups_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bed_coverages
    ADD CONSTRAINT fk_bed_coverages_read_groups_1 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: bed_regions fk_bed_regions_bed_groups; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bed_regions
    ADD CONSTRAINT fk_bed_regions_bed_groups FOREIGN KEY (bed_group_id) REFERENCES bed_groups(id);


--
-- Name: coverage_depths fk_coverage_depths_read_groups_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coverage_depths
    ADD CONSTRAINT fk_coverage_depths_read_groups_1 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: duplicate_groups fk_duplicate_groups_read_groups; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY duplicate_groups
    ADD CONSTRAINT fk_duplicate_groups_read_groups FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: duplicate_reads fk_duplicate_reads_read_groups_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY duplicate_reads
    ADD CONSTRAINT fk_duplicate_reads_read_groups_1 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: gc_biases fk_gc_biases_read_groups_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gc_biases
    ADD CONSTRAINT fk_gc_biases_read_groups_1 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: insert_sizes fk_insert_sizes_read_groups_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY insert_sizes
    ADD CONSTRAINT fk_insert_sizes_read_groups_1 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: library_complexities fk_lib_complexities_read_groups; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY library_complexities
    ADD CONSTRAINT fk_lib_complexities_read_groups FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: rna_seq_avg_transcript_coverages fk_rails_0755165997; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rna_seq_avg_transcript_coverages
    ADD CONSTRAINT fk_rails_0755165997 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: idx_stats fk_rails_1bfdff3e60; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY idx_stats
    ADD CONSTRAINT fk_rails_1bfdff3e60 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: sam_flagstats fk_rails_2402b85288; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sam_flagstats
    ADD CONSTRAINT fk_rails_2402b85288 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: idx_stats fk_rails_2cad2e2c57; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY idx_stats
    ADD CONSTRAINT fk_rails_2cad2e2c57 FOREIGN KEY (genome_id) REFERENCES genomes(id);


--
-- Name: transcripts fk_rails_388131b11b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transcripts
    ADD CONSTRAINT fk_rails_388131b11b FOREIGN KEY (loaded_file_id) REFERENCES loaded_files(id);


--
-- Name: bedgraph_files fk_rails_3da3efdaa5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bedgraph_files
    ADD CONSTRAINT fk_rails_3da3efdaa5 FOREIGN KEY (loaded_file_id) REFERENCES loaded_files(id);


--
-- Name: per_transcript_coverages fk_rails_42438b84f4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_transcript_coverages
    ADD CONSTRAINT fk_rails_42438b84f4 FOREIGN KEY (bedgraph_file_id) REFERENCES bedgraph_files(id);


--
-- Name: genes fk_rails_54a55a38a5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY genes
    ADD CONSTRAINT fk_rails_54a55a38a5 FOREIGN KEY (loaded_file_id) REFERENCES loaded_files(id);


--
-- Name: features_transcripts fk_rails_55b388599a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY features_transcripts
    ADD CONSTRAINT fk_rails_55b388599a FOREIGN KEY (transcript_id) REFERENCES transcripts(id);


--
-- Name: bed_groups fk_rails_56de9fa9c3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bed_groups
    ADD CONSTRAINT fk_rails_56de9fa9c3 FOREIGN KEY (genome_id) REFERENCES genomes(id);


--
-- Name: rna_seq_metrics fk_rails_5e57e04f6b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rna_seq_metrics
    ADD CONSTRAINT fk_rails_5e57e04f6b FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: bedgraph_files fk_rails_61c36d410e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bedgraph_files
    ADD CONSTRAINT fk_rails_61c36d410e FOREIGN KEY (read_group_id) REFERENCES read_groups(id);


--
-- Name: per_transcript_coverages fk_rails_67f53836c2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_transcript_coverages
    ADD CONSTRAINT fk_rails_67f53836c2 FOREIGN KEY (transcript_id) REFERENCES transcripts(id);


--
-- Name: per_transcript_coverages fk_rails_70480cce16; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY per_transcript_coverages
    ADD CONSTRAINT fk_rails_70480cce16 FOREIGN KEY (read_group_id) REFERENCES read_groups(id);


--
-- Name: loaded_files fk_rails_75191029b6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY loaded_files
    ADD CONSTRAINT fk_rails_75191029b6 FOREIGN KEY (genome_id) REFERENCES genomes(id);


--
-- Name: read_groups fk_rails_7c11d63ac0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY read_groups
    ADD CONSTRAINT fk_rails_7c11d63ac0 FOREIGN KEY (genome_id) REFERENCES genomes(id);


--
-- Name: features_transcripts fk_rails_7ebd4f4bf0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY features_transcripts
    ADD CONSTRAINT fk_rails_7ebd4f4bf0 FOREIGN KEY (feature_id) REFERENCES features(id);


--
-- Name: observed_taxa fk_rails_8b357d37a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observed_taxa
    ADD CONSTRAINT fk_rails_8b357d37a3 FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: unmapped_rescue_metrics fk_rails_9bb4b43c91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unmapped_rescue_metrics
    ADD CONSTRAINT fk_rails_9bb4b43c91 FOREIGN KEY (read_group_id) REFERENCES read_groups(id);


--
-- Name: methylation_statuses fk_rails_a28bea5c63; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY methylation_statuses
    ADD CONSTRAINT fk_rails_a28bea5c63 FOREIGN KEY (read_group_id) REFERENCES read_groups(id);


--
-- Name: transcripts fk_rails_a85ff317e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transcripts
    ADD CONSTRAINT fk_rails_a85ff317e1 FOREIGN KEY (gene_id) REFERENCES genes(id);


--
-- Name: read_group_properties fk_rails_b8daa2e491; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY read_group_properties
    ADD CONSTRAINT fk_rails_b8daa2e491 FOREIGN KEY (read_group_id) REFERENCES read_groups(id);


--
-- Name: transcript_abundances fk_rails_be32bbfc55; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transcript_abundances
    ADD CONSTRAINT fk_rails_be32bbfc55 FOREIGN KEY (read_group_id) REFERENCES read_groups(id);


--
-- Name: hybrid_selection_metrics fk_rails_c804d967bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hybrid_selection_metrics
    ADD CONSTRAINT fk_rails_c804d967bd FOREIGN KEY (rg_id) REFERENCES read_groups(id);


--
-- Name: features fk_rails_c9b2adb53f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY features
    ADD CONSTRAINT fk_rails_c9b2adb53f FOREIGN KEY (loaded_file_id) REFERENCES loaded_files(id);


--
-- Name: methylation_statuses fk_rails_d5e60581ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY methylation_statuses
    ADD CONSTRAINT fk_rails_d5e60581ca FOREIGN KEY (bed_region_id) REFERENCES bed_regions(id);


--
-- Name: read_group_properties fk_rails_fcb6c2fe49; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY read_group_properties
    ADD CONSTRAINT fk_rails_fcb6c2fe49 FOREIGN KEY (property_id) REFERENCES properties(id);


--
-- Name: read_groups fk_read_groups_runs_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY read_groups
    ADD CONSTRAINT fk_read_groups_runs_1 FOREIGN KEY (run_id) REFERENCES runs(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20140625020612'),
('20140628010341'),
('20140628033904'),
('20140630211431'),
('20140701202346'),
('20150127133115'),
('20150325203900'),
('20150327135325'),
('20150812223831'),
('20150813011735'),
('20150813131331'),
('20150813182355'),
('20150813195356'),
('20150914172916'),
('20150914173534'),
('20150923012229'),
('20151015151154'),
('20151205192312'),
('20151209034031'),
('20160114121399'),
('20160114121400'),
('20160114154800'),
('20160128215649'),
('20160203223845'),
('20160209160203'),
('20160212210138'),
('20160219200122'),
('20160222204515'),
('20160223185021'),
('20160225160120'),
('20160302215015'),
('20160304165341'),
('20160310222203'),
('20160311191807'),
('20160315182627'),
('20160415212029'),
('20160419130023'),
('20160419131245'),
('20160503132930'),
('20160503175812'),
('20160506201617'),
('20160510163000'),
('20160510163023'),
('20160512135906'),
('20160601201102'),
('20160602151725'),
('20160602194002'),
('20160603184746'),
('20160614150919'),
('20160620140428'),
('20160620144017'),
('20160620185112'),
('20160621143318'),
('20160816191139'),
('20160816191829'),
('20161216182355'),
('20161229213643'),
('20170106182351'),
('20170418190552'),
('20170418211820'),
('20170419190717'),
('20170420171010'),
('20170424193938'),
('20170425142421'),
('20170426172015'),
('20170426174239'),
('20170525151729'),
('20170609015028'),
('20170726111700'),
('20170809093000'),
('20170825200305'),
('20170825200718'),
('20170829162418'),
('20170831190724'),
('20170905002413'),
('20170906181837');


