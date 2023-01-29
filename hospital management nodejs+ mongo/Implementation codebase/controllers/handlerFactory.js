
//factory handler for creating,updating,deleting,getting 
//Can be reused for any controller  

const catchAsync=require('../utils/catchAsync')
const ApiError=require('../utils/apiError')

exports.deleteOne = (Model) =>
  catchAsync(async (req, res, next) => {
    let doc = await Model.findByIdAndDelete(req.params.id);
    if (!doc) return next(new ApiError(404, "No document found with that id"));
    res.status(204).json({
      status: "success",
      data: null,
    });
  });

exports.updateOne = (Model) =>
  catchAsync(async (req, res, next) => {
    let updatedData = await Model.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    if (!updatedData)
      return next(new ApiError(404, "No data found with that id"));
    res.status(200).json({
      status: "success",
      requestedAT: req.requestTime,
      data: updatedData,
    });
  });

exports.createOne = (Model) =>
  catchAsync(async (req, res, next) => {
    const newData = await Model.create(req.body);
    res.status(201).json({
      status: "success",
      newData,
    });
  });

exports.getOne = (Model, popOptions) =>
  catchAsync(async (req, res, next) => {
    let query = Model.findById(req.params.id);
    if (popOptions) query = query.populate(popOptions);

    const data = await query;
    if (!data) return next(new ApiError(404, "No data found with that id"));
    res.status(200).json({
      status: "success",
      data,
    });
  });

exports.getAll = (Model) =>
  catchAsync(async (req, res, next) => {
    const data = await Model.find();
    res.status(200).json({
      status: "success",
      results: data.length,
      data,
    });
  });
