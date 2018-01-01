function files = getFiles( datasetDir, pattern )
files = dir(fullfile(datasetDir, pattern));
end

