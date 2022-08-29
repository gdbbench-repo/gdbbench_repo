import os
import sys
rhost = "val06"
duration = 300
# nodes=1000000
nodes=1000000
stage="r"
# stage="l"

database_dir = None
# database_dir = "ali/first_test"

threads = []
alias_to_run = []

# threads += [40]
# threads += [1, 2, 4, 6, 8]
# threads += [10, 12, 14, 16, 18]
# threads += [20, 22, 24, 26, 28]
# threads += [30, 32, 34, 36, 38]
# threads += [40, 42, 44, 46]
# threads += [1, 10, 20, 30, 40]
threads += [40, 30, 20, 10, 1]
# threads += [40]
# threads += [10, 1]

# alias_to_run += ["ccgraphfake"]

# alias_to_run += ["ccgraph2pl"]
# alias_to_run += ["ccgraphocc"]
# alias_to_run += ["ccgraphsilo"]
# alias_to_run += ["ccgraphsilosnap"]

# alias_to_run += ["ccgraphoccvec"]
# alias_to_run += ["ccgraph2plvec"]
# alias_to_run += ["alineo4j_noreset"]
# alias_to_run += ["neo4j_noreset"]
# alias_to_run += ["loadalicsv"]
# alias_to_run += ["alineo4j"]

# alias_to_run += ["gdbbench_ccgraphfake"]

# alias_to_run += ["gdbbench_ccgraphsilosnap"]
# alias_to_run += ["gdbbench_ccgraph2pl"]
# alias_to_run += ["gdbbench_ccgraphsilo"]
# alias_to_run += ["gdbbench_ccgraphocc"]

# alias_to_run += ["gdb_mix_ccgraphfake"]

# alias_to_run += ["gdbbench_split_silosnap"]
# alias_to_run += ["gdbbench_split_2pl"]
# alias_to_run += ["gdbbench_split_silo"]
# alias_to_run += ["gdbbench_split_occ"]

alias_to_run += ["gdb_mix_silosnap"]
# alias_to_run += ["gdb_mix_2pl"]
# alias_to_run += ["gdb_mix_silo"]
# alias_to_run += ["gdb_mix_occ"]


 
alias_to_param = {
    # prog name                      property file                                                 custom param    reset script              stop script
    "loadalicsv" :                   ["linkbench/config/LinkConfigCSVLoad.properties",             "",             "",                                                                  ""],
    "alimysql" :                     ["linkbench/config/LinkConfigMysqlAli.properties",            "",             " ./graph-bench-scripts/mysql-remote-reset.sh ",                    ""],
    "alineo4j" :                     ["linkbench/config/LinkConfigNeo4jAli.properties",            "",             " ./graph-bench-scripts/neo4j-remote-reset.sh ",                    ""],
    "alineo4j_noreset" :             ["linkbench/config/LinkConfigNeo4jAli.properties",            "",             " ",                                                                 " "],
    "neo4j_noreset" :                ["linkbench/config/LinkConfigNeo4jBenching.properties",       "",             " ",                                                                 " "],

    "gdb_mix_ccgraphfake" :          ["linkbench/config/LinkConfigCCGraphFake.properties", "-Dworkload_file=config/MixWorkload.properties",          "", ""],
    "gdbbench_ccgraphfake" :         ["linkbench/config/LinkConfigCCGraphFake.properties", "-Dworkload_file=config/Workload.properties",             "", ""],
    "ccgraphfake" :                  ["linkbench/config/LinkConfigCCGraphFake.properties", "-Dworkload_file=config/BenchingWorkload.properties",     "", ""],

    "gdb_mix_occ" :          ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55551 -Dworkload_file=config/MixWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart occ ",       " ./graph-bench-scripts/ccgraph-remote-util.sh stop occ "],
    "gdb_mix_2pl" :          ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55550 -Dworkload_file=config/MixWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart 2pl ",       " ./graph-bench-scripts/ccgraph-remote-util.sh stop 2pl "],
    "gdb_mix_silosnap" :     ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55552 -Dworkload_file=config/MixWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart silo_snap ", " ./graph-bench-scripts/ccgraph-remote-util.sh stop silo_snap "],
    "gdb_mix_silo" :         ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55553 -Dworkload_file=config/MixWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart silo ",      " ./graph-bench-scripts/ccgraph-remote-util.sh stop silo "],

    "gdbbench_ccgraphocc" :          ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55551 -Dworkload_file=config/Workload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart occ ",       " ./graph-bench-scripts/ccgraph-remote-util.sh stop occ "],
    "gdbbench_ccgraph2pl" :          ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55550 -Dworkload_file=config/Workload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart 2pl ",       " ./graph-bench-scripts/ccgraph-remote-util.sh stop 2pl "],
    "gdbbench_ccgraphsilosnap" :     ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55552 -Dworkload_file=config/Workload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart silo_snap ", " ./graph-bench-scripts/ccgraph-remote-util.sh stop silo_snap "],
    "gdbbench_ccgraphsilo" :         ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55553 -Dworkload_file=config/Workload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart silo ",      " ./graph-bench-scripts/ccgraph-remote-util.sh stop silo "],

    "gdbbench_split_occ" :          ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55551 -Dworkload_file=config/SplitWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart occ ",       " ./graph-bench-scripts/ccgraph-remote-util.sh stop occ "],
    "gdbbench_split_2pl" :          ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55550 -Dworkload_file=config/SplitWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart 2pl ",       " ./graph-bench-scripts/ccgraph-remote-util.sh stop 2pl "],
    "gdbbench_split_silosnap" :     ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55552 -Dworkload_file=config/SplitWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart silo_snap ", " ./graph-bench-scripts/ccgraph-remote-util.sh stop silo_snap "],
    "gdbbench_split_silo" :         ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55553 -Dworkload_file=config/SplitWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart silo ",      " ./graph-bench-scripts/ccgraph-remote-util.sh stop silo "],

    "ccgraphocc" :                   ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55551 -Dworkload_file=config/BenchingWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart benching_occ ",       " ./graph-bench-scripts/ccgraph-remote-util.sh stop benching_occ "],
    "ccgraph2pl" :                   ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55550 -Dworkload_file=config/BenchingWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart benching_2pl ",       " ./graph-bench-scripts/ccgraph-remote-util.sh stop benching_2pl "],
    "ccgraphsilosnap" :              ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55552 -Dworkload_file=config/BenchingWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart benching_silo_snap ", " ./graph-bench-scripts/ccgraph-remote-util.sh stop benching_silo_snap "],
    "ccgraphsilo" :                  ["linkbench/config/LinkConfigCCGraph.properties",     "-Dport=55553 -Dworkload_file=config/BenchingWorkload.properties", " ./graph-bench-scripts/ccgraph-remote-util.sh restart benching_silo ",      " ./graph-bench-scripts/ccgraph-remote-util.sh stop benching_silo "],

}

def get_env_cmd():
    if database_dir != None:
        env_cmd = "export DATASET_DIR={} ".format(database_dir)
    else:
        env_cmd = "export DATASET_DIR=p{}_submission ".format(nodes)
    env_cmd += " ; export rhost={} ".format(rhost)
    return env_cmd;

def execute(cmd):
    print(cmd, file=sys.stderr)
    os.system(cmd)

def launch(alias):
    if alias in ["csvneo4j", "loadalicsv"]:
        if stage != "l":
            print("csv must be use with load")
            return
    reset_database_command = alias_to_param[alias][2]

    composed_cmd = " ; ".join([get_env_cmd(), reset_database_command])

    execute(composed_cmd)


def shutdown(alias):
    if alias in ["csvneo4j", "loadalicsv"]:
        if stage != "l":
            print("csv must be use with load")
            return
    stop_db_cmd = alias_to_param[alias][3]

    composed_cmd = " ; ".join([get_env_cmd(), stop_db_cmd])

    execute(composed_cmd)

def run(alias, thread):
    if alias in ["csvneo4j", "loadalicsv"]:
        if stage != "l":
            print("csv must be use with load")
            return
    config_file = alias_to_param[alias][0]
    extra_param = alias_to_param[alias][1]
    # reset_database_command = alias_to_param[alias][2]
    # stop_db_cmd = alias_to_param[alias][3]

    log_path = "logs/Node_{}_Rqster_{}_Duration_{}".format(nodes, thread, duration)

    ##### touch log path
    bench_runner= "mkdir -p " + log_path

    bench_runner += " ; ./run.sh -c " + config_file
    bench_runner += " -" + stage
    bench_runner += " -Dduration=" + str(duration)
    bench_runner += " -Drequesters=" + str(thread)

    # required by id2chooser for follow edge generation
    # bench_runner += " -Dmaxid1=" + str(nodes+1)
    # bench_runner += " -Drandomid2max=" + str(nodes+1)

    bench_runner += " " + extra_param

    if stage == "l":
        bench_runner += " > {}/{}_load".format(log_path, alias)
    else:
        bench_runner += " > {}/{}".format(log_path, alias)

    composed_cmd = " ; ".join([get_env_cmd(), bench_runner])

    execute(composed_cmd)

def usage():
    print("usage: python3 <thisscript.py> <runmode>")
    print("     runmode: 0 : no start and stop ")
    print("     runmode: 1 : restart on first thread, stop on last thread ")
    print("     runmode: 2 : always restart")
    pass

if __name__ == "__main__":
    from sys import argv
    if len(argv) <= 1:
        usage()
        exit(1)
    run_mode = int(argv[1])
    # 0 : no start and stop
    # 1 : restart on first thread, stop on last thread
    # 2 : always restart
    for alias in alias_to_run:
        if run_mode == 1:
            launch(alias)

        for thread in threads:
            if run_mode == 2:
                launch(alias)

            run(alias, thread)

            if run_mode == 2:
                shutdown(alias)

        if run_mode == 1:
            shutdown(alias)