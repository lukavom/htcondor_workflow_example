rule aggregate_software:
    localrule: True
    input:
        f"{workflow.workdir_init}/custom_software/Makefile",
        f"{workflow.workdir_init}/custom_software/main.cpp"
    output:
        f'{config["PATH_SHARED_FS_OUTPUT"]}/custom_software/custom_software.tar.gz'
    shell:
        """
        echo "Creating tarball for custom software"
        JOBDIR=$(mktemp -d)
        tar --create -v -z --exclude=.git --file $JOBDIR/custom_software.tar.gz custom_software/
        cp $JOBDIR/custom_software.tar.gz {output}
        echo "Tarball created at {output}"
        echo "Content of tarball:"
        tar -tzf {output}
        """

rule compile_software:
    input:
        rules.aggregate_software.output
    output:
        f'{config["PATH_SHARED_FS_OUTPUT"]}/custom_software/custom_software_compiled.tar.gz'
    shell:
        """
        JOBDIR=$(mktemp -d)
        cd $JOBDIR

        cp {input} .
        tar --extract -v -z --file custom_software.tar.gz

        cd custom_software
        make

        cd ..
        tar --create -v -z --file custom_software_compiled.tar.gz custom_software
        mv custom_software_compiled.tar.gz {output}
        """

rule copy_setup_script_to_sharedfs:
    localrule: True
    input:
        f'{workflow.workdir_init}/setup_custom_software_runtime.sh'
    output:
        f'{config["PATH_SHARED_FS_OUTPUT"]}/custom_software/setup_custom_software_runtime.sh'
    shell:
        """
        mkdir -p $(dirname {output})
        cp {input} {output}
        """