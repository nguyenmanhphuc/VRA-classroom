function output = LoadInfo(infoPath)
    load(infoPath);
    output.features_per_image = features_per_image;
    output.files = files;
end

